module Ldmc
  class ReadSequencesController < ApplicationController
    before_action :load_patient
    before_action :load_visit
    before_action :set_read_sequence, only: [:show, :edit, :update]

    def show
    end

    def edit
    end
    
    def index
    end

    def update
      respond_to do |format|
        if @read_sequence.update_attributes(read_sequence_params)
          format.html { redirect_to [@patient, @visit, @read_sequence], notice: 'Read Sequence was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @read_sequence.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def set_read_sequence
        @read_sequence = @visit.read_sequences.find(params[:id])
      end

      def load_patient
        @patient = Patient.find(params[:patient_id])
      end

      def load_visit
        @visit = @patient.visits.find(params[:visit_id])
      end

      def read_sequence_params
        params.require(:read_sequence)
              .permit(
                      :sequence_name,
                      :sequence_ann
                      )
      end
  end
end

