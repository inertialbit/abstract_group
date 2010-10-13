module GroupsHelper
  def abstract_group_checkboxes(form)
    render :partial => 'groups/group_checkboxes', :object => form
  end
end