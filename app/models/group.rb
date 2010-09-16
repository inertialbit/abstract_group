class Group < ActiveRecord::Base
  set_table_name "abstract_group_groups"
  
  include Groupable
  
  has_many :registered_memberships, {
    :class_name => "Membership",
    :table_name => Membership.table_name,
    :dependent => :destroy
  }
  
  validates_uniqueness_of :name
  validates_length_of :name, :within => (4..255)
  
  def members
    return [] if registered_memberships.count == 0
    registered_memberships.find(:all).collect do |membership|
      membership.member
    end
  end
  
  def self.abstract_class?
    false
  end
end