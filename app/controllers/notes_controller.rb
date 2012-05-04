class NotesController < ApplicationController
  
  respond_to :html, :json

  # GET /notes
  # GET /notes.json
  def index
    @budget = Budget.includes(:notes).find(params[:budget_id])
    @notes = @budget.notes
    @note = Note.new

    respond_with(@budget, @notes)
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @budget = Budget.find(params[:budget_id])
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @note.budget_id = params[:budget_id]

    respond_to do |format|
      if @note.save
        format.html { redirect_to budget_notes_path, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to index }
      format.json { head :no_content }
    end
  end
end
