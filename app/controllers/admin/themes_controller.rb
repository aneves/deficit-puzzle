class Admin::ThemesController < AdminController
  before_filter :admin_required
  layout 'admin'

  # GET /admin/themes
  def index
    @themes = Theme.order :id
  end

  # GET /admin/themes/1
  def show
    @theme = Theme.find(params[:id])
  end

  # GET /admin/themes/new
  def new
    @theme = Theme.new
  end

  # GET /admin/themes/1/edit
  def edit
    @theme = Theme.find(params[:id])
  end

  # POST /admin/themes
  def create
    @theme = Theme.new(params[:theme])
    # GAH! Does not save... how did this break? D:
    # Need internet to fix it, I can't boot up debugger without it.
    @theme.approved = true

    if @theme.save
      redirect_to admin_themes_path, :notice => t(:created, :model => t("theme._"))
    else
      render :action => "new"
    end
  end

  # PUT /admin/themes/1
  def update
    @theme = Theme.find(params[:id])

    if @theme.update_attributes(params[:theme])
      redirect_to [:admin, :root], :notice => t(:updated, :model => t("theme._"))
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/themes/1
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy

    redirect_to admin_themes_url
  end

  # GET /admin/theme/:id/approve
  def approve
    theme = Theme.find(params[:id])
    theme.approved = true
    theme.save!
    
    redirect_to [:admin, :root], :notice => t(:approved, :model => t("theme._"))
  end

  # GET /admin/theme/:id/suspend
  def suspend
    theme = Theme.find(params[:id])
    theme.approved = false
    theme.save!
    
    redirect_to [:admin, :root], :notice => t(:suspended, :model => t("theme._"))
  end
end
