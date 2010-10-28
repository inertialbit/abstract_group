require "abstract_group"
require "rails"

module AbstractGroup
  class Engine < Rails::Engine
    ASSET_PREFIX = "abstract_group"
    ENGINEER_VERSION = "0.2.3"

    initializer "abstract_group.require_dependencies" do
      require 'bundler'
      gemfile = Bundler::Definition.build(root.join('Gemfile'), root.join('Gemfile.lock'), {})
      specs = gemfile.dependencies.select do |d|
        d.name != 'engineer' and (d.groups & [:default, :production]).any?
      end

      specs.collect { |s| s.autorequire || [s.name] }.flatten.each do |r|
        require r
      end
    end

    initializer "abstract_group.action_view.identifier_collection" do
      require 'abstract_group/action_view'
    end

    initializer "abstract_group.asset_path" do
      require 'abstract_group/asset_path'
      setup_asset_path
    end
  end
end
