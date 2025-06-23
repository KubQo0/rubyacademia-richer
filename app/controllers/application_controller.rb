class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  helper_method :user_signed_in?, :current_user
end
