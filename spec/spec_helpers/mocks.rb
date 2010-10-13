def mock_errors(stubs={})
  mock(ActiveModel::Errors, {
    :[] => [],
    :full_messages => []
  })
end

def method_missing(method_name, *args)
  super unless method_name.to_s =~ /^mock_.*/
  
  stubs = args.first || {}
  options = args.extract_options!
  new_mock = method_name.to_s =~ /^mock_new_\w*/
  mock_name = method_name.to_s.gsub("mock_", "")
  mock_name = mock_name.gsub("new_", "") if new_mock
  unless new_mock
    mock_object(mock_name, stubs, options)
  else
    mock_new_object(mock_name, stubs, options) if new_mock
  end
end

def mock_object(name, stubs={}, options={})
  class_name = name.capitalize.classify.constantize
  unless instance_variable_defined?("@#{name}")
    instance_variable_set("@#{name}", mock_model(class_name, stubs.merge!({
      :errors => mock_errors
    })))
  else
    instance_variable_get("@#{name}")
  end
end

def mock_new_object(name, stubs={}, options={})
  class_name = name.capitalize.classify.constantize
  unless instance_variable_defined?("@new_#{name}")
    instance_variable_set("@new_#{name}", mock_model(class_name, stubs.merge!({
      :errors => mock_errors
    })))
  else
    instance_variable_get("@new_#{name}")
  end
end