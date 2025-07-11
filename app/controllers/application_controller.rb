class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :wrap_with_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def wrap_with_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :given_name, :family_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :given_name, :family_name ])
  end
end
