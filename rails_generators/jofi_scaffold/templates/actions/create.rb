  def create
    @<%= singular_name %> = <%= class_name %>.new(params[:<%= singular_name %>])
    if @<%= singular_name %>.save
      flash[:notice] = t('creation_successfull') + ': ' + t('activerecord.models.<%= name %>')
      redirect_to <%= item_path('url') %>
    else
      render :action => 'new'
    end
  end
