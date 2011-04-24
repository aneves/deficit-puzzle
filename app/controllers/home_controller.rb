class HomeController < ApplicationController
  # GET /home/index
  def index
    @themes = Theme.order :id
    @target = 450
    @units = ""
  end
end
