class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  # http://stackoverflow.com/questions/119197/the-rails-way-namespaces/120168#120168
  # "The conditional on authenticate_or_request_with_http_basic triggers the
  # HTTP Basic auth in production mode or when you append ?admin_http=true to any URL"
  def admin_required
    authenticate_or_request_with_http_basic do |user_name, password|
      # TODO: abstract this auth to an isolated file. Preferably something configurable on deploy.
      user_name == 'admin' && password == '123456 hehe'
    end if RAILS_ENV == 'production' || params[:admin_http]
  end
end
