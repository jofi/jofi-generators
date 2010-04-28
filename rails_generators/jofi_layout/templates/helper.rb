# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
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
  
  def admin_area(&block)
    if admin_logged_in?
      concat(content_tag(:div, content_tag(:span, capture(&block), :class => 'admin_span'), :class => "admin_div"))
    end
  end    
end
