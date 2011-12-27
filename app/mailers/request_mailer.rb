class RequestMailer < ActionMailer::Base
  #default from: "from@example.com"
  
  def request_submitted(request)
    @request = request
    #attachments["pdf.pdf"] = File.read("#{Rails.root}/public/pdfs")
    mail(:to => "#{@request.first_name} <#{@request.email}>", :subject => "Thank You For Viewing Our Prices", :from => "noreply@bridalkaleidoscope.com")
  end
end
