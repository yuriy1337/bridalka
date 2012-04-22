class RequestMailer < ActionMailer::Base
  #default from: "from@example.com"
  
  def request_submitted(request)
    @request = request
    #attachments["pdf.pdf"] = File.read("#{Rails.root}/public/pdfs")
    mail(:to => "#{@request.first_name} <#{@request.email}>", :subject => "Thank You For Viewing Our Prices", :from => "mail@bridalkaleidoscope.com")
  end
  
  def request_submitted_selfnotify(request)
    @request = request
    #attachments["pdf.pdf"] = File.read("#{Rails.root}/public/pdfs")
    mail(:to => "yuriy1337@gmail.com", :subject => "A Prices Request Has Been Submitted", :from => "mail@bridalkaleidoscope.com")
  end
end
