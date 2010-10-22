module AbstractGroup
  class Engine < Rails::Engine
    engine_name :abstract_group
    config.asset_path = "/abstract_group%s"
    config.action_view.javascript_expansions[:abstract_group] = %w(jquery-1.4.1.min.js rails)
    #config.gem 'formtastic'
  end

  mattr_reader :app_type
  @@app_type = AbstractGroup::Engine
end
