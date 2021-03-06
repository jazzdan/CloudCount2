class LinesController < ApplicationController
  
  respond_to :html, :json

  before_filter :setup
  before_filter :require_login

  def setup
    @subtitle = 'Lines'
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
    @line = Line.includes({:sublines => :transactions}).find(params[:id])
    @budget = @line.budget
    @subtitle = '%s %d' % [@line.category.capitalize, @line.line_number]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line }
    end
  end

  # GET /lines/new
  # GET /lines/new.json
  def new
    @budget = Budget.find(params[:budget_id])
    @line = Line.new
    @line.category = params[:category]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line }
    end
  end

  # GET /lines/1/edit
  # TODO: Might have to modify this
  def edit
    @line = Line.find(params[:id])
    @budget = @line.budget
  end

  # POST /lines
  # POST /lines.json
  def create
    @line = Line.new(params[:line])
    @line.budget_id = params[:budget_id]
    @budget = @line.budget

    respond_to do |format|
      if @line.save
        format.html { redirect_to budget_path(@budget), notice: 'Line was successfully created.' }
        format.json { render json: @line, status: :created, location: @line }
      else
        format.html { render action: "new" }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lines/1
  # PUT /lines/1.json
  # TODO: Might have to modify this
  def update
    @line = Line.find(params[:id])
    @budget = @line.budget

    respond_to do |format|
      if @line.update_attributes(params[:line])
        format.html { redirect_to budget_path(@budget), notice: 'Line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @line = Line.find(params[:id])
    @line.destroy

    respond_to do |format|
      format.html { redirect_to budget_path(@line.budget) }
      format.json { head :no_content }
    end
  end
end
