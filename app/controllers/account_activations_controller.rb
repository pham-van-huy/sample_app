class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by_email(params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      user.update_attribute :activated, true
      user.update_attribute :activated_at, Time.zone.now
      log_in user
      flash[:success] = t "mailer.user.account_activated"
      redirect_to user
    else
      flash[:danger] = t "mailer.user.invalid_link"
      redirect_to root_url
    end
  end
end
