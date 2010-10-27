module AbstractGroup::ApplicationHelper
  def link_wrapper(path, wrapper_options={}, link_options={})
    tag       = wrapper_options.delete(:tag) || :p
    link_text = link_options.delete(:link_text) || path
    highlight = wrapper_options.delete(:highlight)
  
    unless path.blank?
      if current_page?(path) && (highlight.nil? || highlight)
        wrapper_options = {:class => (wrapper_options[:class] || '') + " nav_highlight"}
      end
    end
  
    content_tag(tag, wrapper_options) do
      link_to(link_text, path, link_options)
    end
  end
  def abstract_group_checkboxes(form)
    render :partial => 'groups/group_checkboxes', :object => form
  end

  def link_to_groups
    link_wrapper(groups_path, {}, {
      :link_text => "Full list of Groups (#{Group.count})"
    })
  end

  def link_to_new_group
    link_wrapper(new_group_path, {}, {
      :link_text => "Create New Group"
    })
  end

  def link_to_new_group_membership(group)
    link_wrapper(new_group_membership_path(group), {}, {
      :link_text => "Create New Membership"
    })
  end
end
