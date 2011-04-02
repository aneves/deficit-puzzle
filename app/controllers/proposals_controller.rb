class ProposalsController < ApplicationController
  # GET /proposals
  def index
    @proposals = Proposal.all
  end

  # GET /proposals/1
  def show
    @proposal = Proposal.find(params[:id])
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /proposals
  def create
    @proposal = Proposal.new(params[:proposal])

    if @proposal.save
      redirect_to @proposal, :notice => 'Proposal was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /proposals/1
  def update
    @proposal = Proposal.find(params[:id])

    if @proposal.update_attributes(params[:proposal])
      redirect_to @proposal, :notice => 'Proposal was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /proposals/1
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to proposals_url
  end
end
