class SublinesController < ApplicationController
  
  before_filter :setup
  before_filter :require_login

  respond_to :html, :json
  
  def setup
    @subtitle = 'Sublines'
  end

  # GET /sublines
  # GET /sublines.json
  def index
    @line = Line.includes(:sublines).find(params[:line_id])
    @budget = @line.budget
    @sublines = @line.sublines
    @subline = Subline.new

    respond_with(@budget, @lines)
  end

  # GET /sublines/new
  # GET /sublines/new.json
  def new
    @line = Line.find(params[:line_id])
    @budget = @line.budget
    @subline = Subline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subline }
    end
  end

  # GET /sublines/1/edit
  def edit
    @subline = Subline.find(params[:id])
    @line = @subline.line
    @budget = @line.budget
  end

  # POST /sublines
  # POST /sublines.json
  def create
    @subline = Subline.new(params[:subline])
    @subline.line_id = params[:line_id]
    @line = @subline.line
    @budget = @subline.line.budget

    respond_to do |format|
      if @subline.save
        format.html { redirect_to budget_line_path(@budget, @line), notice: 'Subline was successfully created.' }
        format.json { render json: @subline, status: :created, location: @subline }
      else
        format.html { render action: "new" }
        format.json { render json: @subline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sublines/1
  # PUT /sublines/1.json
  def update
    @subline = Subline.find(params[:id])
    @line = @subline.line
    @budget = @line.budget

    respond_to do |format|
      if @subline.update_attributes(params[:subline])
        format.html { redirect_to budget_line_path(@budget, @line), notice: 'Subline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sublines/1
  # DELETE /sublines/1.json
  def destroy
    @subline = Subline.find(params[:id])
    @subline.destroy

    respond_to do |format|
      format.html { redirect_to budget_line_path(@subline.line.budget, @subline.line) }
      format.json { head :no_content }
    end
  end
end
