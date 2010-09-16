class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :abstract_group_memberships do |t|
      t.integer :group_id
      t.integer :member_id
      t.string :member_type
    end
    
    add_index :abstract_group_memberships, [:group_id, :member_id]
    add_index :abstract_group_memberships, [:member_id, :member_type]
  end

  def self.down
    drop_table :abstract_group_memberships
  end
end
