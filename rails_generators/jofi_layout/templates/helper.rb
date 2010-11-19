# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  
  def pages(objects, options = {})
    options[:prev_label] = t('previous_page')
    options[:next_label] = t('next_page')
    res = '<br/>'
    p = will_paginate(objects, options) || '' 
    res += p 
    res += '<br/>'
    return res
  end
  
  def render_searchmask(&block)
    @searchmask ||= {:magic => ""}
    concat(form_tag(nil, { :id => :searchmask, :method => :get, :onSubmit => "Element.show('spinner');" }))
    yield
    #concat(submit_tag t('search'))
    concat("</form>")
    concat("<img alt='spinner' id='spinner' src='/images/spinner.gif' style='display:none;' />")
    concat(observe_form(:searchmask, :frequency => 1, :update => :items, :loading => "Element.show('spinner')", :complete => "Element.hide('spinner')", :method => :get))      
  end
    
  
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
#  def render_flash
#    output = []
#    
#    for key,value in flash
#      output << "<span class=\"#{key.to_s.downcase}\">#{value}</span>"
#    end if flash
#    
#    output.join("<br/>\n")
#  end
  
  def admin_logged_in?
    true
  end
  
  def admin_area(&block)
    if admin_logged_in?
      concat(content_tag(:div, content_tag(:span, capture(&block), :class => 'admin_span'), :class => "admin_div"))
    end
  end    
end
