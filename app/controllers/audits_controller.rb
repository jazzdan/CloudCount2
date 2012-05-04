class AuditsController < ApplicationController

  def index
    @audits = Audit.all
  end

  def show
    @audit = Audit.find(params[:id])
  end

end
