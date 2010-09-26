# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'abstract-group/version'
 
Gem::Specification.new do |s|
  s.name = "abstract-group"
  s.summary = "Provides grouping behavior to arbitrary objects in a system."
  s.homepage = "http://github.com/inertialbit/abstract-group"
  s.description = "Provides grouping behavior to arbitrary objects in a system.

  Can be run either as an Engine or standalone Rails app.

  Use as Engine

  - Setup integration app with edge rails
  - Build & Install abstract-group gem
  - Update integration app's Gemfile to use the abstract-group gem
  - Copy migrations & Create symlinks to public
  - Setup database and run migrations

  Rake tasks provided by edge rails:

    FROM=abstract_group rake railties:copy_migrations
    rake railties:create_symlinks"
  s.version = AbstractGroup::Version.number
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jeremiah Heller"]
  s.email = ["jeremiah@inertialbit.net"]
  s.summary = "Rails 3 Abstract Group Engine"
  s.files = Dir["Gemfile", "{lib}/**/*", "{app}/**/*", "{config}/**/*", "{db}/migrate/**/*", "{db}/seeds.rb", "{public}/images/**/*", "{public}/stylesheets/**/*", "{public}/javascripts/**/*", "{public}/abstract_group/**/*"]
  s.required_rubygems_version = ">= 1.3.7"

  s.add_dependency('rails', '>= 3.0.0')
  s.add_dependency('sqlite3-ruby')
  s.add_dependency('formtastic')
  
  s.add_development_dependency('rspec-rails', '>= 2.0.0.beta.22')
  s.add_development_dependency('cucumber-rails')
  s.add_development_dependency('capybara')
  s.add_development_dependency('acts_as_fu')
end