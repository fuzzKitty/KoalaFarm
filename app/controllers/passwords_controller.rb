class PasswordsController < ApplicationController

  def request_form
  end

  def reset_form
  end

  def forgot
    if params[:email].blank? # check if email is present
      return render json: {error: 'Email not present'}
    end

    user = User.find_by(email: params[:email]) # if present find user by email

    if user.present?
      user.generate_password_token! #generate pass token
      begin
        UserMailer.pw_reset_email(@user).deliver_now
      rescue
        Rails.logger.debug 'Mailer sender paramenters not configured'
      end
      # render json: {status: 'ok'}, status: :ok
      redirect_to passwords_resetform_url, alert: 'Reset email sent'
    else
      # render json: {error: ['Email address not found.Please check and try again.']}, status: :not_found
      redirect_to passwords_request_url, alert: 'Email address not found.Please check and try again'
    end
  end

  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: 'Token not present'}
    end

    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if params[:password] == params[:password_confirmation]
        if user.reset_password!(params[:password])
          redirect_to login_url, alert: 'Password successfully reset!'
        else
          redirect_to passwords_resetform_url, alert: 'Invalid data submitted'
        end
      else
        redirect_to passwords_resetform_url, alert: 'Passwords do not match'
      end
    else
      redirect_to passwords_resetform_url, alert: 'Invalid token'
    end
  end

end
