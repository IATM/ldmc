module Ldmc
  class LesionsController < ApplicationController
    before_action :load_subject, only: [:show, :edit, :update, :new, :create, :destroy]
    before_action :load_read_sequence, only: [:show, :edit, :update, :new, :create, :destroy]
    before_action :set_lesion, only: [:show, :edit, :update, :destroy]

    def show
    end

    def edit
    end

    def new
      @lesion = @read_sequence.lesions.build
    end

    def create
      @lesion = @read_sequence.lesions.build(lesion_params)

      respond_to do |format|
        if @lesion.save
          format.html { redirect_to [@subject, @read_sequence, @lesion], notice: 'Lesion was successfully created.' }
          format.json { render action: 'show', status: :created, location: @lesion }
        else
          format.html { render action: 'new' }
          format.json { render json: @lesion.errors, status: :unprocessable_entity }
          end
      end
    end

    def update
      respond_to do |format|
        if @lesion.update_attributes(lesion_params)
         format.html { redirect_to [@subject, @read_sequence, @lesion], notice: 'Lesion was successfully updated.' }
         format.json { head :no_content }
        else
         format.html { render action: 'edit' }
        format.json { render json: @lesion.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @lesion.destroy
      respond_to do |format|
        format.html { redirect_to [@subject, @read_sequence, @lesion], notice: 'Lesion was successfully deleted.'  }
        format.json { head :no_content }
      end
    end


    private

    def set_lesion
      @lesion = @read_sequence.lesions.find(params[:id])
    end

    def load_read_sequence
      @read_sequence = @subject.read_sequences.find(params[:read_sequence_id])
    end

    def load_subject
      @subject = Subject.find(params[:subject_id])
    end

    def lesion_params
      params.require(:lesion)
            .permit(:type,
                    :size_ax,
                    {vertebral_level: []},
                    :clarity,
                    {spine_localization: []},
                    :intensity_lesion,
                    :intensity_normalspine,
                    :intensity_nape,
                    :created_by
                    )
    end
  end
end
