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

    if @theme.save
      redirect_to admin_themes_path, :notice => 'Theme was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /admin/themes/1
  def update
    @theme = Theme.find(params[:id])

    if @theme.update_attributes(params[:theme])
      redirect_to admin_theme_path(@theme), :notice => 'Theme was successfully updated.'
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
end
