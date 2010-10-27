module GroupsHelper
  def abstract_group_checkboxes(form)
    render :partial => 'groups/group_checkboxes', :object => form
  end
  
  def link_to_groups
    link_wrapper(abstract_group.groups_path, {}, {
      :link_text => "Full list of Groups (#{Group.count})"
    })
  end
  
  def link_to_new_group
    link_wrapper(abstract_group.new_group_path, {}, {
      :link_text => "Create New Group"
    })
  end
  
  def link_to_new_group_membership(group)
    link_wrapper(abstract_group.new_group_membership_path(group), {}, {
      :link_text => "Create New Membership"
    })
  end
end