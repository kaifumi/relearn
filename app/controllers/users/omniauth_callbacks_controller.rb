# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # # callback for facebook
  # def facebook
  #   callback_for(:facebook)
  # end

  # callback for twitter
  def twitter
    callback_from :twitter
  end

  # # callback for google
  # def google_oauth2
  #   callback_for(:google)
  # end

  # common callback method
  # def callback_for(provider)
  #   @user = User.find_for_oauth(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
  #     set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
  #   else
  #     session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
  #     redirect_to new_user_registration_url
  #   end
  # end

  private

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      TotalPoint.create!(user_id: current_user.id) if TotalPoint.find_by(user_id: current_user).nil?
      Rate.create!(user_id: current_user.id) if Rate.find_by(user_id: current_user).nil?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
