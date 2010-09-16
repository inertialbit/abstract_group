module Groupable
  def self.included(base)
    base.instance_eval do
      include Associations
    end
  end
  def self.abstract_class?
    false
  end
  # Contains association declarations for tying together arbitrary objects
  # with group objects.
  module Associations
    def self.included(base)
      base.instance_eval do
        has_many :memberships, {:as => :member, :dependent => :destroy}
        has_many :groups, {:through => :memberships}
      end
    end
  end
end