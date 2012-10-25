require "net/http"

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :is_store_up
  
  def button_for(name, options={})
    return content_tag(:button, content_tag(:span, content_tag(:span, name)), :class => options[:class], :type => options[:button_type])
  end
  
  def is_store_up
    
    url = URI.parse("http://store.bridalkaleidoscope.com/")
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path)
    
    res.header.each_header {|key,value| puts "#{key} = #{value}" }
    
    if(!res['server'].include?("nginx"))
      if res['content-length'] != nil && res['content-length'].to_i > 1000
        return true
      end 
    end
    return false
  end
end
