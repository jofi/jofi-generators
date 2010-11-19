class <%= class_name %> < ActiveRecord::Base
  class << self
    def search(searchmask, parent_scope = nil)
      searchmask ||= {}
      parent_scope ||= scoped({:order => "name"})
      parent_scope = parent_scope.scoped({:conditions => ['name like ?', "%#{searchmask[:magic]}%"]}) if !searchmask[:magic].blank?      
      return parent_scope
    end
  end
end
