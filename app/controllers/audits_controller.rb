class AuditsController < ApplicationController
  def index
    @audits = Audit.all
  end

  def show
    @audit = Audit.find(params[:id])
  end

  def new
    @audit = Audit.new
  end

  def create
    @audit = Audit.new(params[:audit])
    if @audit.save
      redirect_to @audit, :notice => "Successfully created audit."
    else
      render :action => 'new'
    end
  end

  def edit
    @audit = Audit.find(params[:id])
  end

  def update
    @audit = Audit.find(params[:id])
    if @audit.update_attributes(params[:audit])
      redirect_to @audit, :notice  => "Successfully updated audit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @audit = Audit.find(params[:id])
    @audit.destroy
    redirect_to audits_url, :notice => "Successfully destroyed audit."
  end
end
