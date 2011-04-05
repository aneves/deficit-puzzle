class HomeController < ApplicationController
  # GET /home/index
  def index
    @proposals = Proposal.where(:approved => true).order :id
    @target = 450
    @units = "units"
  end
end
