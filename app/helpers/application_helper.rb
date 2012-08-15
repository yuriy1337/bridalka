module ApplicationHelper
  
  def current_page_or_referrer_in(options)
    url_string = CGI.unescapeHTML(url_for(options))
    request = @controller.request
    # We ignore any extra parameters in the request_uri if the
    # submitted url doesn't have any either.  This lets the function
    # work with things like ?order=asc
    if url_string.index("?")
      request_uri = request.request_uri
      referrer_uri = request.referrer
    else
      request_uri = request.request_uri.split('?').first
      referrer_uri = request.referrer.split('?').first
    end
  
    #referrer_uri always has full path (protocol, host, port) so we need to be sure to compare apples w apples
    if url_string =~ /^\w+:\/\//
      ["#{request.protocol}#{request.host_with_port}#{request_uri}", referrer_uri].include?(url_string)
    else
      referrer_uri = referrer_uri.gsub(request.protocol, '').gsub(request.host_with_port, '')
      [request_uri, referrer_uri].include?(url_string)
    end
  end
  
end
