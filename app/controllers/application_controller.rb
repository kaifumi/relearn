class ApplicationController < ActionController::Base
	# CSRF対策 サイトへのコード攻撃を防ぐ
	protect_from_forgery with: :exception
	# devise動作時の利用カラムを制限する
	before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_user, :logged_in?

	 protected

	def configure_permitted_parameters
		added_attrs = [:name, :email, :password, :password_confirmation]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end

	def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
	end

	def logged_in?
    !session[:user_id].nil?
 end

	def authenticate
		return if logged_in?

		redirect_to root_path
 end
end
