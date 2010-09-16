require 'spec_helper'

describe GroupsController do
  describe "GET :index" do
    it "loads groups as @groups" do
      loads_groups{ get :index }
    end
    it "renders the index template" do
      get :index
      response.should render_template("groups/index")
    end
  end
  
  describe "GET :new" do
    before(:each) do
      Group.stub(:new).and_return(mock_new_group)
    end
    it "loads groups as @groups" do
      loads_groups{ get :new }
    end
    it "instantiates a new group as @group" do
      get :new
      assigns[:group].should eql @new_group
    end
    it "renders the new template" do
      get :new
      response.should render_template("groups/new")
    end
  end
  
  describe "GET :show, :id => integer" do
    before(:each) do
      Group.stub(:find).with(1).and_return(mock_group)
    end
    it "loads a group as @group" do
      get :show, :id => 1
      assigns[:group].should eql mock_group
    end
    it "renders the show template" do
      get :show, :id => 1
      response.should render_template("groups/show")
    end
  end
  
  describe "GET :edit, :id => integer" do
    before(:each) do
      Group.stub(:find).with(1).and_return(mock_group)
      Group.stub(:find).with(:all, :order => 'name').and_return([mock_group])
      Group.stub(:abstract_class?).and_return(false)
    end
    it "loads a group as @group" do
      get :edit, :id => 1
      assigns[:group].should eql mock_group
    end
    it "loads groups as @groups" do
      get :edit, :id => 1
      assigns[:groups].should eql [mock_group]
    end
    it "renders the edit template" do
      get :edit, :id => 1
      response.should render_template("groups/edit")
    end
  end
  
  describe "POST :create, :group => {}" do
    before(:each) do
      Group.stub(:new).and_return(mock_group({
        :save => nil
      }))
    end
    it "instantiates a new group as @group" do
      post :create
      assigns[:group].should eql @group
    end
    it "saves the new group" do
      @group.should_receive(:save)
      post :create
    end
    context "save succeeds :)" do
      before(:each) do
        @group.stub(:save).and_return(true)
      end
      it "sets a flash[:notice]" do
        post :create
        flash[:notice].should_not be_nil
      end
      it "redirects to the group show page" do
        post :create
        response.should redirect_to group_path(@group)
      end
    end
    context "save fails :(" do
      before(:each) do
        @group.stub(:save).and_return(false)
      end
      it "loads groups as @groups" do
        loads_groups{ post :create }
      end
      it "renders the new template" do
        post :create
        response.should render_template("groups/new")
      end
    end
  end
  
  describe "POST :update, :id => integer, :group => {}" do
    before(:each) do
      mock_group({
        :update_attributes => nil
      })
      Group.stub(:find).with(1).and_return(@group)
      Group.stub(:find).with(:all, :order => 'name').and_return([@group])
    end
    it "loads a group as @group" do
      put :update, :id => 1
      assigns[:group].should eql mock_group
    end
    it "updates the group" do
      mock_group.should_receive(:update_attributes)
      put :update, :id => 1
    end
    context "update succeeds :)" do
      before(:each) do
        mock_group.stub(:update_attributes).and_return(true)
      end
      it "sets a flash[:notice]" do
        put :update, :id => 1
        flash[:notice].should_not be_nil
      end
      it "redirects to the group show page" do
        put :update, :id => 1
        response.should redirect_to group_path(mock_group)
      end
    end
    context "update fails :(" do
      before(:each) do
        mock_group.stub(:update_attributes).and_return(false)
      end
      it "loads groups as @groups" do
        put :update, :id => 1
        assigns[:groups].should eql [@group]
      end
      it "renders the edit template" do
        put :update, :id => 1
        response.should render_template("groups/edit")
      end
    end
  end
  
  describe "POST :destroy, :id => integer" do
    before(:each) do
      Group.stub(:destroy).and_return(mock_group)
    end
    it "destroys a group" do
      Group.should_receive(:destroy)
      delete :destroy, :id => 1
    end
    it "sets a flash[:notice]" do
      delete :destroy, :id => 1
      flash[:notice].should_not be_nil
    end
    it "redirects to the group index page" do
      delete :destroy, :id => 1
      response.should redirect_to groups_path
    end
  end
end
