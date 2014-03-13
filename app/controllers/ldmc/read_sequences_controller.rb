module Ldmc
  class ReadSequencesController < ApplicationController
    before_action :load_subject, only: [:show, :edit, :update, :new, :create, :destroy]
    before_action :set_read_sequence, only: [:show, :edit, :update, :destroy]

    def all
      @read_sequences = Subject.all.map {|p| p.subjects.map {|v| v.read_sequences}}.flatten
      @subjects = Subject.all.map {|p| p.subjects.map}.flatten
      @flair_read_sequences = Subject.where("subjects.read_sequences.sequence_name" => "3D FLAIR").map {|p| p.subjects.map {|v| v.read_sequences.where(sequence_name: "3D FLAIR")}}.flatten
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
      params.require(:read_sequence).permit(:sequence_name, :sequence_ann)
    end
  end
end


