# require 'abstract-group'
# require 'rails'

module AbstractGroup
  class Application < Rails::Engine
    engine_name :abstract_group
    config.action_controller.asset_path = "abstract_group/%s"
  end
end