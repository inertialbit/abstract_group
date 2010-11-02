class AbstractGroup::ApplicationController < ApplicationController
  protect_from_forgery

  prepend_before_filter :use_engine_assets if Rails.env != 'production'
  prepend_before_filter :setup_asset_path if defined?(AbstractGroup::Engine)
  
  private
    def use_engine_assets
      require 'abstract_group/action_view'
    end
    def setup_asset_path
      config.asset_path = '/abstract_group%s'
    end
  protected
  public
end
