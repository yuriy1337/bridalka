class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def button_for(name, options={})
    return content_tag(:button, content_tag(:span, content_tag(:span, name)), :class => options[:class], :type => options[:button_type])
  end
end
