# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email])

    if user&.valid_password?(user_params[:password])
      sign_in user

      flash[:notice] = I18n.t("devise.sessions.signed_in")

      redirect_to dashboard_path
    else
      flash[:alert] = I18n.t("devise.failure.invalid", authentication_keys: "email")

      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out

    redirect_to root_path
  end

  def user_params
    params
      .require(:user)
      .permit(:email, :password)
  end
end
