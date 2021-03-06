class Admin::ProposalsController < AdminController
  before_filter :admin_required
  before_filter :load_theme
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
    @proposal.theme_id = params[:theme_id]
  end

  # GET /admin/theme/:theme_id/proposals/:id/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /admin/theme/:theme_id/proposals
  def create
    @proposal = Proposal.new(params[:proposal])
    theme = Theme.find(params[:theme_id])
    @proposal.theme = theme

    if @proposal.save
      redirect_to [:admin, :root], :notice => t(:created, :model => t("proposal._"))
    else
      render :action => "new"
    end
  end

  # PUT /admin/theme/:theme_id/proposals/:id
  def update
    @proposal = Proposal.find(params[:id])

    if @proposal.update_attributes(params[:proposal])
      redirect_to [:admin, @proposal.theme, @proposal], :notice => t(:updated, :model => t("proposal._"))
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
    proposal = Proposal.find(params[:id])
    proposal.approved = true
    proposal.save!
    
    redirect_to [:admin, @theme, proposal], :notice => t(:approved, :model => t("proposal._"))
  end

  # GET /admin/theme/:theme_id/proposals/:id/suspend
  def suspend
    proposal = Proposal.find(params[:id])
    proposal.approved = false
    proposal.save!
    
    redirect_to [:admin, @theme, proposal], :notice => t(:suspended, :model => t("proposal._"))
  end
  
  protected
  def load_theme
	# TODO: load as method/property? Memoized.
    @theme = Theme.find(params[:theme_id])
  end
end
