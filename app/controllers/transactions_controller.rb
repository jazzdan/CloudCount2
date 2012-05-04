class TransactionsController < ApplicationController
  
  respond_to :html, :json

  def setup
    @subtitle = 'Transactions'
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new
    @subline = Subline.find(params[:subline_id])
    @line = @subline.line
    @budget = @line.budget

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
    @subline = @transaction.subline
    @line = @subline.line
    @budget = @line.budget
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(params[:transaction])
    @subline = Subline.find(params[:subline_id])
    @line = @subline.line
    @budget = @line.budget

    @transaction.subline_id = @subline.id

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to budget_line_path(@budget, @line), notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])
    @subline = @transaction.subline
    @line = @subline.line
    @budget = @line.budget

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to budget_line_path(@budget, @line), notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @line = @transaction.subline.line
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to budget_line_path(@line.budget_id, @line), notice: 'Transaction was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
