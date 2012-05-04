class SublinesController < ApplicationController
  
  respond_to :html, :json
  
  # GET /sublines
  # GET /sublines.json
  def index
    @line = Line.includes(:sublines).find(params[:line_id])
    @sublines = @line.sublines
    @subline = Subline.new

    respond_with(@budget, @lines)
  end

  # GET /sublines/1
  # GET /sublines/1.json
  def show
    @subline = Subline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subline }
    end
  end

  # GET /sublines/new
  # GET /sublines/new.json
  def new
    @line = Line.find(params[:line_id])
    @subline = Subline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subline }
    end
  end

  # GET /sublines/1/edit
  def edit
    @subline = Subline.find(params[:id])
  end

  # POST /sublines
  # POST /sublines.json
  def create
    @subline = Subline.new(params[:subline])
    @subline.line_id = params[:line_id]
    @line = @subline.line

    respond_to do |format|
      if @subline.save
        format.html { redirect_to line_subline_path(@line, @subline), notice: 'Subline was successfully created.' }
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
    @line = @subline.budget

    respond_to do |format|
      if @subline.update_attributes(params[:subline])
        format.html { redirect_to line_subline_path(@line, @subline), notice: 'Subline was successfully updated.' }
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
      format.html { redirect_to line_sublines_path(@subline.line) }
      format.json { head :no_content }
    end
  end
end
