class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :abstract_group
  
  private
    def abstract_group
      if defined?(AbstractGroup::Engine)
        super
      else
        return self
      end
    end
  protected
  public
end
