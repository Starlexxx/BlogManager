# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def require_admin
    reditect_to blog_path unless current_user.is_admin?
  end

  around_action :switch_locale

  def switch_locale(&action)
    locale = cookies[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
