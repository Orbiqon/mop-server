# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['MAILJET_LABEL']} <#{ENV['MAILJET_EMAIL']}>"
  layout 'mailer'
end
