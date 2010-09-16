require 'spec_helper'

describe Membership do
  before(:each) do
    @membership = Membership.new
  end
  it "uses the table name abstract_group_memberships" do
    Membership.table_name.should eql "abstract_group_memberships"
  end
  it "belongs to a :group" do
    @membership.should respond_to :build_group
  end
  it "belongs to a polymorphic :member" do
    @membership.should respond_to :member
  end
end
