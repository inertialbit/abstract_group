require 'spec_helper'
require 'acts_as_fu'
RSpec.configure do |config|
  config.include ActsAsFu
end

class Fake < ActiveRecord::Base
  set_table_name "abstract_group_groups"
  include Groupable
end unless defined?(Fake)

describe MembershipsController do
  before(:each) do
    Group.stub(:find).with("1").and_return(mock_group)
  end
  describe ":new, :group_id => required" do
    before(:each) do
      Membership.stub(:new).and_return(mock_new_membership)
      Group.stub(:all).and_return([mock_group])
      @p = {:group_id => "1"}
    end
    it "instantiates a new Membership as @membership" do
      Membership.should_receive(:new).and_return(mock_new_membership)
      get :new, @p
      assigns[:membership].should eql mock_new_membership
    end
    it "loads all Groups as @groups" do
      Group.should_receive(:all).and_return([mock_group])
      get :new, @p
      assigns[:groups].should eql [mock_group]
    end
    it "loads all Groupable.types objects as @members" do
      Fake.should_receive(:find).with(:all).and_return([[mock_fake]])
      get :new, @p
      assigns[:members].should eql [mock_fake]
    end
  end
  
  describe ":create, :group_id => required" do
    before(:each) do
      @p = {:group_id => "1", :membership => {}}
    end
    context "valid records" do
      before(:each) do
        @memberships = ["one","two","three"]
        Member.stub(:create!).and_return(@memberships)
      end
      it "creates a membership for each member" do
        Member.should_receive(:create!)
        post :create, @p
      end
      it "sets a flash[:notice]" do
        post :create, @p
        flash[:notice].should_not be_nil
      end
      it "redirects to groups#index" do
        post :create, @p
        response.should redirect_to groups_path
      end
    end
    context "invalid records" do
      before(:each) do
        Member.stub(:create!).and_raise(
          ActiveRecord::RecordInvalid.new(mock_membership)
        )
      end
      it "loads all Groups as @groups" do
        Group.should_receive(:all).and_return([mock_group])
        post :create, @p
        assigns[:groups].should eql [mock_group]
      end
      it "loads all Groupable.types objects as @members" do
        Fake.should_receive(:find).with(:all).and_return([[mock_fake]])
        post :create, @p
        assigns[:members].should eql [mock_fake]
      end
      it "renders the new template" do
        post :create, @p
        response.should render_template("memberships/new")
      end
    end
  end
end
