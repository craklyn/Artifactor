class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def root
    redirect_to artifacts_path
  end

  def email_form

  end

  def send_email
    flash[:notice] = "Email sent to #{params[:invite][:email]}!"
    redirect_to artifacts_path
    InviteMailer.invite_collaborator(params[:invite][:email]).deliver_now
  end
end
