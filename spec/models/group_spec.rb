require 'spec_helper'

describe Group do
  before(:each) do
    @group = Group.new
  end
  it "uses the table name abstract_group_groups" do
    Group.table_name.should eql "abstract_group_groups"
  end
  it "has many registered memberships" do
    @group.should respond_to :registered_memberships
    @group.registered_memberships.respond_to?(:build).should be_true
  end
  it "has many members (explicit instanct method)" do
    @group.should respond_to :members
    @group.members.should be_kind_of Array
  end
  it "it destroys all memberships when deleted but leaves members intact" do
    group = Group.create!({:name => "Groupie Group"})
    groupie_one = Group.create!({:name => "Groupie One"})
    groupie_two = Group.create!({:name => "Groupie Two"})
    Membership.create!({:group => group, :member => groupie_one})
    Membership.create!({:group => group, :member => groupie_two})
    
    Membership.count.should eql 2
    Membership.all.each do |m|
      m.group.should eql group
    end
    
    group.destroy
    Membership.count.should eql 0
    Group.count.should eql 2 # expect 2 since primary group was destroyed
  end
  describe "valid instance" do
    before(:each) do
      @val_attr = {
        :name => "Groupie Group"
      }
      @group = Group.new(@val_attr)
    end
    it "has a unique name" do
      @group.save!
      group = Group.new({:name => "Groupie Group"})
      group.should have(1).errors_on(:name)
    end
    it "has a name with at least 4 characters" do
      @group.name = "Som"
      @group.should have_at_least(1).errors_on(:name)
    end
    it "has a name with no more than 255 characters" do
      @group.name = "A very long name should not be accepted as a Group name"+
                    " because it will not make very much sense and it will"+
                    " make it hard to determine the purpose of a specific"+
                    " Grouping. 255 characters may actually be too long as"+
                    " this message is ridiculously long........."+
                    " Actually everything before now including that string"+
                    " of dots is 256 characters."
      @group.should have(1).errors_on(:name)
    end
  end
end
