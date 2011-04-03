class HomeController < ApplicationController
  # GET /home/index
  def index
    @proposals = Proposal.where(:approved => true).order :id
  end
end
