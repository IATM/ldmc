module Ldmc
class ReadGeneralsController < ApplicationController
  before_action :load_patient, only: [:show, :edit, :update, :new, :create]
  before_action :load_visit, only: [:show, :edit, :update, :new, :create]
  before_action :set_read_general, only: [:show, :edit, :update]
  before_action :set_breadcrumbs, only: [:show, :edit, :new]
 
  def all
    #add_breadcrumb "All Read Sequence", read_generals_path
    @read_generals = Patient.all.map {|p| p.visits.map {|v| v.read_generals}}.flatten
  end

  def show
    add_breadcrumb "Read General:", visit_read_general_path(@visit,@read_general)
  end

  def edit
    add_breadcrumb "Editing read general", edit_visit_read_general_path(@visit,@read_general)
  end

  def new
    add_breadcrumb "New read general", new_visit_read_general_path(@visit)
    @read_general = @visit.read_generals.build
  end

  def create
    @read_general = @visit.read_generals.build(read_general_params)

    respond_to do |format|
      if @read_general.save
        format.html { redirect_to [@visit, @read_general], notice: 'Read General was successfully created.' }
        format.json { render action: 'show', status: :created, location: @read_general }
      else
        format.html { render action: 'new' }
        format.json { render json: @read_general.errors, status: :unprocessable_entity }
      end
    end
  end




  def update
    respond_to do |format|
      if @read_general.update_attributes(read_general_params)
        format.html { redirect_to [@visit, @read_general], notice: 'Lession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @read_general.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_breadcrumbs
    
    
    add_breadcrumb "Visits", visits_path(@visit)
    add_breadcrumb @visit.start.to_s(:long), visit_path(@visit)
  end
    def set_read_general
      @read_general = @visit.read_generals.find(params[:id])
    end

    def load_patient
      @patient = Patient.find(params[:patient_id])
    end

    def load_visit
      @visit = @patient.visits.find(params[:visit_id])
    end
    

    def read_general_params
      params.require(:read_general)
      .permit(
              {lession_dir: []},
              :level_dir,
              :level_flair
              )
    end
end
end

      