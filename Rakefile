# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

AbstractGroup::Application.load_tasks

Engineer::Tasks.new do |gem|
  gem.name = "abstract_group"
  gem.summary = %Q{Provides grouping behavior to arbitrary objects in a system.}
  gem.description = %Q{Provides grouping behavior to arbitrary objects in a system.}
  gem.email = "jeremiah@inertialbit.net"
  gem.homepage = "http://github.com/inertialbit/abstract-group"
  gem.authors = ["Jeremiah Heller"]
  gem.require_path = 'lib'
  gem.files =  FileList[
    "[A-Z]*",
    "{app,config,lib,public,spec,test}/**/*",
    "db/**/*.rb"
  ]

  # Include Bundler dependencies
  Bundler.definition.dependencies.each do |dependency|
    next if dependency.name == "engineer"

    if (dependency.groups & [:default, :production]).any?
      gem.add_dependency dependency.name, *dependency.requirement.as_list
    else
      gem.add_development_dependency dependency.name, *dependency.requirement.as_list
    end
  end

  # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
end
