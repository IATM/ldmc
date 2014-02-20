module Ldmc
  class ReadLdmc < ApplicationController
    before_action :load_patient
    before_action :load_visit
    before_action :set_read_ldmc, only: [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @read_ldmc.update_attributes(read_ldmc_params)
          format.html { redirect_to [@patient, @visit, @read_ldmc], notice: 'Read ldmc was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @read_ldmc.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def set_read_ldmc
        @read_ldmc = @visit.read_ldmc
      end
      
      def load_patient
        @patient = Patient.find(params[:patient_id])
      end
      
      def load_visit
        @visit = @patient.visits.find(params[:visit_id])
      end

      def read_ldmc_params
        params.require(:read_ldmc)
              .permit(
                      {lesion_dir: []},
                      :level_dir,
                      :level_flair
                      )
      end

     
  end
end
