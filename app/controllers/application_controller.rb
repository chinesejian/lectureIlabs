class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :name
    [:first_name, :last_name].each {|attribute| devise_parameter_sanitizer.for(:sign_up) << attribute}
  end
end
