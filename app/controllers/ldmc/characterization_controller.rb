module Ldmc
  class ReadLdmc < ApplicationController
    before_action :load_patient
    before_action :load_visit
    before_action :set_characterization, only: [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @characterization.update_attributes(characterization_params)
          format.html { redirect_to [@patient, @characterization], notice: 'Characterization was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @characterization.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def set_characterization
        @characterization = @patient.characterization
      end

      def characterization_params
        params.require(:characterization)
              .permit(
                      {pathologic: []},
                      {autoimmune: []},
                      {neurologic: []},
                      {psychiatric: []},
                      :surgical,
                      {ob_gyn: []},
                      :birth_control,
                      {toxic: []},
                      :addictions,
                      :allergic,
                      :recent_vaccines,
                      :trauma,
                      :comments
                      )
      end

      def load_patient
        @patient = Patient.find(params[:patient_id])
      end
  end
end
