module Ldmc
  class ReadSequencesController < ApplicationController
    skip_authorization_check
  
    before_action :load_subject, only: [:index, :show, :edit, :update, :new, :create, :destroy]
    before_action :set_read_sequence, only: [:show, :edit, :update, :destroy]

    def all
      if current_user.id.to_s=="5345b8dd6d61634023000000"
        @read_sequences = Subject.all.map {|s| s.read_sequences.all(rad:"1")}.flatten
      else
         @read_sequences = Subject.all.map {|s| s.read_sequences.all(rad:"2")}.flatten
      end
      
      @sorted_sequences= @read_sequences.sort {|a,b| a.sequence_ann.delete('S').to_i <=> b.sequence_ann.delete('S').to_i}
      
    end

    def index
      @read_sequences = @subject.read_sequences.all
    end

    def show
      @sorted_lesions= @read_sequence.lesions.sort {|a,b| b.size_ax <=> a.size_ax}
    end

    def edit
      @user=current_user.id
    end

    def new
      @read_sequence = @subject.read_sequences.build
    end

    def create
      @read_sequence = @subject.read_sequences.build(read_sequence_params)

      respond_to do |format|
        if @read_sequence.save
          format.html { redirect_to [@subject, @read_sequence], notice: 'Lession was successfully created.' }
          format.json { render action: 'show', status: :created, location: @read_sequence }
        else
          format.html { render action: 'new' }
          format.json { render json: @read_sequence.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
    
      respond_to do |format|
          @read_sequence.assign_attributes(read_sequence_params)
          @read_sequence.updated_by=current_user.id
          if @read_sequence.lesions.present?
            @read_sequence.nolesion_tri=false
          end
        
         if @read_sequence.save
           
          format.html { redirect_to read_sequences_path}
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @read_sequence.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_read_sequence
      @read_sequence = @subject.read_sequences.find(params[:id])
    end

    def load_subject
      @subject = Subject.find(params[:subject_id])
    end

    def read_sequence_params
      params.require(:read_sequence).permit(:sequence_name, :sequence_ann,:nolesion_tri,:rad,:updated_by,
                                            :lesions_attributes => [:id,
                                                                    :type,
                                                                    :size_ax,
                                                                    {vertebral_level: []},
                                                                    :clarity,
                                                                    {spine_localization: []},
                                                                    :intensity_lesion,
                                                                    :intensity_normalspine,
                                                                    :intensity_nape,
                                                                    :_destroy,
                                                                    :created_by])
    end
  end
end


