class LeadNotifierMailer < ApplicationMailer
    default :from => 'admin@rocketelevators-wc26.tk'

  def send_lead_email(lead)
    @lead = lead
    mail( :to => @lead.email,
    :subject => 'Thanks for contacting us!' )
  end
end