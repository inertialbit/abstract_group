class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :abstract_group_groups do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :abstract_group_groups
  end
end
