module Ldmc
class LessionsController < ApplicationController
  before_action :load_patient, only: [:show, :edit, :update, :new, :create, :destroy]
  before_action :load_visit, only: [:show, :edit, :update, :new, :create, :destroy]
  before_action :load_read_sequence, only: [:show, :edit, :update, :new, :create, :destroy]
  before_action :set_lession, only: [:show, :edit, :update, :destroy]
  #before_action :set_breadcrumbs, only: [:show, :edit, :new]


  
  def show
    #add_breadcrumb "Lession:",  visit_read_sequence_lession_path(@visit,@read_sequece,@lession)
  end

  def edit
    #add_breadcrumb "Editing Lession", edit_visit_read_sequence_lession_path(@visit,@read_sequece,@lession)
    
  end

  def new
    #add_breadcrumb "New Read Sequence", new_visit_read_sequence_lession_path(@visit,@read_sequece)
    @lession = @read_sequence.lessions.build
  end

  def create
    @lession = @read_sequence.lessions.build(lession_params)

    respond_to do |format|
      if @lession.save
        format.html { redirect_to [@visit,@read_sequence, @lession], notice: 'Lession was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lession }
      else
        format.html { render action: 'new' }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
        end
    end
  end




  def update
    respond_to do |format|
      if @lession.update_attributes(lession_params)
       format.html { redirect_to [@visit,@read_sequence, @lession], notice: 'Lession was successfully updated.' }
       format.json { head :no_content }
      else
       format.html { render action: 'edit' }
      format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    logger.info "@lession: #{@lession}"
    logger.info "@read_sequence: #{@read_sequence}"
    logger.info "@visit: #{@visit}"
 
    @lession.destroy
    respond_to do |format|
      format.html { redirect_to [@visit,@read_sequence, @lession], notice: 'Lession was successfully deleted.'  }
      format.json { head :no_content }
    end
  end
  

  private

  #def set_breadcrumbs
   # add_breadcrumb "Lession", visit_read_sequences_lessions_path(@lession)
    #add_breadcrumb @lessions.start.to_s(:long), visit_read_sequence_lession_path(@lession)
    #end
    
    def set_lession
      @lession = @read_sequence.lessions.find(params[:id])
    
    end
    
    def load_read_sequence
      @read_sequence = @visit.read_sequences.find(params[:read_sequence_id])
    end
    
    def load_visit
      @visit = @patient.visits.find(params[:visit_id])
    end

    def load_patient
      @patient = Patient.find(params[:patient_id])
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
