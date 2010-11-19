class <%= plural_class_name %>Controller < ApplicationController

  def paginate(scope)
    params[:per_page] ||= 10   
    scope.paginate(:page => params[:page], :per_page => params[:per_page])
  end

  <%= controller_methods :actions %>
end
