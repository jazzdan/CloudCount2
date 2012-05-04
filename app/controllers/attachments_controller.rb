class AttachmentsController < ApplicationController

  before_filter :setup
  before_filter :require_login

  respond_to :html, :json

  def setup
    @subtitle = 'Attachments'
  end

  # GET /attachments
  # GET /attachments.json
  def index
    @budget = Budget.includes(:attachments).find(params[:budget_id])
    @attachments = @budget.attachments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])
    @budget = @attachment.budget

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new
    @budget = Budget.find(params[:budget_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attachment }
    end
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(params[:attachment])
    @attachment.budget_id = params[:budget_id]
    @budget = @attachment.budget

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to budget_attachments_path(@budget), notice: 'Attachment was successfully created.' }
        format.json { render json: @attachment, status: :created, location: @attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to budget_attachments_url(@attachment.budget) }
      format.json { head :no_content }
    end
  end
end
