class Membership < ActiveRecord::Base
  set_table_name "abstract_group_memberships"
  
  belongs_to :group
  belongs_to :member, :polymorphic => true
end