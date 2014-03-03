module Ldmc
class LessionsController < ApplicationController
  before_action :load_patient, only: [:show, :edit, :update, :new, :create]
  before_action :load_visit, only: [:show, :edit, :update, :new, :create]
  before_action :set_lessions, only: [:show, :edit, :update]
  before_action :set_breadcrumbs, only: [:show, :edit, :new]
 

  def show
    add_breadcrumb "Lession:",  visit_lession_path(@visit,@lession)
  end

  def edit
    add_breadcrumb "Editing Lession", edit_visit_lession_path(@visit,@lession)
  end

  def new
    add_breadcrumb "New Lession", new_visit_lession_path(@visit)
    @lession = @visit.lessions.build
  end

  def create
    @lession = @visit.lessions.build(lession_params)

    respond_to do |format|
      if @lession.save
        format.html { redirect_to [@visit, @lession], notice: 'Lession was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lession }
      else
        format.html { render action: 'new' }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end




  def update
    respond_to do |format|
      if @lession.update_attributes(read_sequence_params)
        format.html { redirect_to [@visit, @lession], notice: 'Lession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_breadcrumbs
    
    
    add_breadcrumb "Visits", visits_path(@visit)
    add_breadcrumb @visit.start.to_s(:long), visit_path(@visit)
  end
    def set_lessions
      @lession = @visit.lessions.find(params[:id])
    end

    def load_patient
      @patient = Patient.find(params[:patient_id])
    end

    def load_visit
      @visit = @patient.visits.find(params[:visit_id])
    end
    

    def lession_params
      params.require(:lession)
            .permit(
                    :type, 
                    :no_lesion,
                    :size_ax,
                    {vertebral_level: []},
                    :clarity,
                    {spine_localization: []},
                    :intensity_lesion,
                    :intensity_normalspine,
                    :intensity_nape
                    )
    end
end
end
