module ThemesHelper
  def approve_button_for theme
    if theme.approved
    then
      link_to "suspend", suspend_admin_theme_path(theme), :class => 'button'
    else
      link_to "approve", approve_admin_theme_path(theme), :class => 'button'
    end
  end
end
