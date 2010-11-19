  def index
    @searchmask = params[:searchmask]
    @<%= plural_name %> = <%= singular_class_name %>.search(@searchmask)
    
    respond_to do |format|
      format.html do 
        @<%= plural_name %> = paginate @<%= plural_name %>
        if request.xml_http_request?
          render :partial => "<%= singular_name %>_list", :layout => false
        else
          render :action => :index
        end
      end      
    end        
  end
