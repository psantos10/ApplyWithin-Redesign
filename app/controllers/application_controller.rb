class ApplicationController < ActionController::Base
  before_action :prepare_meta_tags, if: "request.get?"
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ImpressionsHelper
  helper_method :register_impression

  def prepare_meta_tags(options={})
    site        = "ApplyWithin"
    title       = [controller_name, action_name].join(" ")
    description = "the free network connecting the high-street with job hunters"
    defaults = {
      description: "The free network connecting bars, restaurants & cafes with local job-hunters.",
      keywords:    %w[applywithin.co.uk apply within with applywithin london hammersmith chiswick shepherd's-bush high-street jobs london part-time full-time bar restaurants bars coffee shops cafes waiter barista vacancy CV],
    }
    options.reverse_merge!(defaults)
    set_meta_tags options
  end

  def current_user
    @current_user ||= warden.authenticate(scope: :user) || GuestUser.new
  end

  def user_signed_in?
    current_user.present? && current_user.class != GuestUser
  end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up)        << :group
  end


end
