module Ldmc 
class ReadSequencesController < ApplicationController
  before_action :load_patient, only: [:show, :edit, :update, :new, :create, :destroy]
  before_action :load_visit, only: [:show, :edit, :update, :new, :create, :destroy]
  before_action :set_read_sequence, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs, only: [:show, :edit, :new]
 
  def all
    #add_breadcrumb "All Read Sequence", read_sequences_path
    @read_sequences = Patient.all.map {|p| p.visits.map {|v| v.read_sequences}}.flatten
    @visits = Patient.all.map {|p| p.visits.map}.flatten
    @flair_read_sequences = Patient.where("visits.read_sequences.sequence_name" => "3D FLAIR").map {|p| p.visits.map {|v| v.read_sequences.where(sequence_name: "3D FLAIR")}}.flatten
  end

  def show
    add_breadcrumb "Read Sequence:", visit_read_sequence_path(@visit,@read_sequence)
  end

  def edit
    add_breadcrumb "Editing read sequence", edit_visit_read_sequence_path(@visit,@read_sequence)
  end

  def new
    add_breadcrumb "New read sequence", new_visit_read_sequence_path(@visit)
    @read_sequence = @visit.read_sequences.build
  end

  def create
    @read_sequence = @visit.read_sequences.build(read_sequence_params)

    respond_to do |format|
      if @read_sequence.save
        format.html { redirect_to [@visit, @read_sequence], notice: 'Lession was successfully created.' }
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
        format.html { redirect_to [@visit, @read_sequence], notice: 'Lession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @read_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_breadcrumbs
    
    
    add_breadcrumb "Visits", visits_path(@visit)
    add_breadcrumb @visit.start.to_s(:long), visit_path(@visit)
  end
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

      