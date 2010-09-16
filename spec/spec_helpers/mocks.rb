def mock_errors(stubs={})
  mock(ActiveModel::Errors, {
    :[] => [],
    :full_messages => []
  })
end
def mock_group(stubs={})
  Group.stub(:abstract_class?).and_return(false)
  @group ||= mock_model(Group, stubs.merge!({
    :errors => mock_errors
  }))
end

def mock_new_group(stubs={})
  @new_group ||= mock_model(Group, stubs.merge!({
    :errors => mock_errors
  })).as_new_record
end