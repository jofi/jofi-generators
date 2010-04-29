  def destroy
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    @<%= singular_name %>.destroy
    flash[:notice] = t('destroy_successfull') + ': ' + t('activerecord.models.<%= singular_name %>')
    redirect_to <%= plural_name %>_url
  end
