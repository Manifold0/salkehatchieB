class ReferenceRequestMailer < ActionMailer::Base
  default from: "references@salkehatchie.org"

  def request_email(reference)
  	@reference = reference
  	mail(to: reference.email, subject: 'Reference Requested')
  end
end
