
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authenticate_admin_user!
    if user_signed_in?
      if current_user.admin?
      else
        redirect_to root_url(subdomain: 'app')
      end
    else
      redirect_to root_url(subdomain: 'app')
    end

  end
 
  private
    def user_not_authorized
      flash[:alert] = "You do not have permission to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
