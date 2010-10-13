require 'spec_helper'

class SomeClass < ActiveRecord::Base
  set_table_name "abstract_group_groups"
  include Groupable
end

describe Member do
  before(:each) do
    @hash = {
      :group_id => "3",
      :some_classes => ["4","5","6","7","8","9"]
    }
  end
  it "create! memberships from a custom membership hash" do
    Membership.should_receive(:create!).exactly(6).times
    Member.create!(@hash)
  end
  it "returns a collection of memberships" do
    memberships = Member.create!(@hash)
    memberships.size.should eql 6
  end
end
