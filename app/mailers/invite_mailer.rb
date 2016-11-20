class InviteMailer < ActionMailer::Base
  default from: 'noreply@artifactor.co'

  def invite_collaborator(to)
    mail(to: to, subject: "You've been invited to collaborate on Artifactor.co")
  end
end