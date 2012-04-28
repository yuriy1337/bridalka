class ContactRequestMailer < ActionMailer::Base
  #default from: "from@example.com"
  
  def contact_request_submitted(request)
    @request = request
    #attachments["pdf.pdf"] = File.read("#{Rails.root}/public/pdfs")
    mail(:to => "mail@bridalkaleidoscope.com", :subject => "Contact Request submitted", :from => "mail@bridalkaleidoscope.com")
  end
end
