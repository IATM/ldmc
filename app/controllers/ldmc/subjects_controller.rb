module Ldmc
  class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
      @subjects = Subject.all
    end

    def show
    end

    def new
      @subject = Subject.new

      @subject.read_sequences.build(sequence_name: '3D FLAIR')
      @subject.read_sequences.build(sequence_name: '3D DIR')
      @subject.read_sequences.build(sequence_name: '2D T1 FLAIR')
      @subject.read_sequences.build(sequence_name: '2D DP')
      @subject.read_sequences.build(sequence_name: '2D STIR')

      @subject.build_read_general
    end

    def edit
    end

    def create
      @subject = Subject.new(subject_params)

      respond_to do |format|
        if @subject.save
          format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
          format.json { render action: 'show', status: :created, location: @subject }
        else
          format.html { render action: 'new' }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @subject.update(subject_params)
          format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @subject.destroy
      respond_to do |format|
        format.html { redirect_to subjects_url }
        format.json { head :no_content }
      end
    end

    private

    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:identification, :sex, :age,
                                      :read_sequences_attributes => [:id, :sequence_name, :sequence_ann, :_destroy],
                                      :read_general_attributes => [:read_ann])
    end
  end
end
