require 'spec_helper'
require 'acts_as_fu'
RSpec.configure do |config|
  config.include ActsAsFu
end

describe Groupable do
  describe "Associations" do
    before(:each) do
      build_model :fake_object do
        ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[Rails.env.to_sym])
        string :name

        include Groupable
      end
      @fake_object = FakeObject.new
    end
    after(:each) do
      Group.destroy_all
      FakeObject.destroy_all
    end
    it "(has many groups) ties arbitrary objects to an instance of Group" do
      @fake_object.should respond_to :groups
      @fake_object.groups.respond_to?(:build).should be_true
    end
    it "allows for arbitrary objects to be assigned a group via group_ids" do
      group = Group.create!({
        :name => "Groupie Group 2"
      })
      fake_obj = FakeObject.create!({
        :name => "Faker",
        :group_ids => [group.id]
      })
      Membership.count.should eql 1
      group.members.should include fake_obj
      fake_obj.groups.should include group
    end
  end
end
