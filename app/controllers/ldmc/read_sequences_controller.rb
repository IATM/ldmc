module Ldmc
  class ReadSequencesController < ApplicationController
    before_action :load_subject, only: [:index, :show, :edit, :update, :new, :create, :destroy]
    before_action :set_read_sequence, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def all
      @read_sequences = Subject.all.map {|s| s.read_sequences}.flatten
    end

    def index
      @read_sequences = @subject .read_sequences.all
    end

    def show
    end

    def edit
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
        if @read_sequence.update_attributes(read_sequence_params)
          format.html { redirect_to [@subject, @read_sequence], notice: 'Lession was successfully updated.' }
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
      params.require(:read_sequence).permit(:sequence_name, :sequence_ann,
                                            :lesions_attributes => [:id,
                                                                    :type,
                                                                    :size_ax,
                                                                    {vertebral_level: []},
                                                                    :clarity,
                                                                    {spine_localization: []},
                                                                    :intensity_lesion,
                                                                    :intensity_normalspine,
                                                                    :intensity_nape,
                                                                    :_destroy])
    end
  end
end


