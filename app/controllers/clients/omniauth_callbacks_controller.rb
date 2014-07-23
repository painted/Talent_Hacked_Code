class Clients::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    @client = Client.from_omniauth(request.env["omniauth.auth"])
    if @client.persisted?
      sign_in_and_redirect @client, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "LinkedIn") if is_navigational_format?
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"]
      redirect_to new_client_registration_path
    end
  end
end