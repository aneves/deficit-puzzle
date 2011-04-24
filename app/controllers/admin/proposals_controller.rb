class Admin::ProposalsController < AdminController
  before_filter :admin_required
  layout 'admin'

  # GET /admin/proposals
  def index
    @proposals = Proposal.order :id
  end

  # GET /admin/proposals/1
  def show
    @proposal = Proposal.find(params[:id])
  end

  # GET /admin/proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /admin/proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /admin/proposals
  def create
    @proposal = Proposal.new(params[:proposal])

    if @proposal.save
      redirect_to admin_proposals_path, :notice => 'Proposal was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /admin/proposals/1
  def update
    @proposal = Proposal.find(params[:id])

    if @proposal.update_attributes(params[:proposal])
      redirect_to [:admin, @proposal.theme, @proposal], :notice => 'Proposal was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/proposals/1
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to admin_proposals_url
  end

  # GET /admin/proposals/1/approve
  def approve
    @proposal = Proposal.find(params[:id])
    @proposal.approved = true
    @proposal.save!
    
    redirect_to admin_proposals_url, :notice => 'Proposal was approved.'
  end

  # GET /admin/proposals/1/cancel
  def cancel
    @proposal = Proposal.find(params[:id])
    @proposal.approved = false
    @proposal.save!
    
    redirect_to admin_proposals_url, :notice => 'Proposal was cancelled.'
  end
end
