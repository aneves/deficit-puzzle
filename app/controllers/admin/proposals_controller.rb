class Admin::ProposalsController < AdminController
  before_filter :admin_required
  layout 'admin'

  # GET /admin/theme/:theme_id/proposals
  def index
    @proposals = Proposal.order :id
  end

  # GET /admin/proposals/:id
  def show
    @proposal = Proposal.find(params[:id])
  end

  # GET /admin/theme/:theme_id/proposals/new
  def new
    @proposal = Proposal.new
    @theme = Theme.find(params[:theme_id])
  end

  # GET /admin/theme/:theme_id/proposals/:id/edit
  def edit
    @proposal = Proposal.find(params[:id])
    @theme = Theme.find(params[:theme_id])
  end

  # POST /admin/theme/:theme_id/proposals
  def create
    @proposal = Proposal.new(params[:proposal])
    theme = Theme.find(params[:theme_id])
    @proposal.theme = theme

    if @proposal.save
      redirect_to admin_theme_proposals_path, :notice => 'Proposal was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /admin/theme/:theme_id/proposals/:id
  def update
    @proposal = Proposal.find(params[:id])

    if @proposal.update_attributes(params[:proposal])
      redirect_to [:admin, @proposal.theme, @proposal], :notice => 'Proposal was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/theme/:theme_id/proposals/:id
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to admin_theme_proposals_url
  end

  # GET /admin/theme/:theme_id/proposals/:id/approve
  def approve
    @proposal = Proposal.find(params[:id])
    @proposal.approved = true
    @proposal.save!
    
    redirect_to admin_theme_proposals_url, :notice => 'Proposal was approved.'
  end

  # GET /admin/theme/:theme_id/proposals/:id/cancel
  def cancel
    @proposal = Proposal.find(params[:id])
    @proposal.approved = false
    @proposal.save!
    
    redirect_to admin_theme_proposals_url, :notice => 'Proposal was cancelled.'
  end
end
