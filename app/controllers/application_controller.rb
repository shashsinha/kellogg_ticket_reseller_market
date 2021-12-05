class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name email_address credit_card_number
                                               credit_card_zip_code credit_card_expiration])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name email_address credit_card_number
                                               credit_card_zip_code credit_card_expiration])
  end
end
