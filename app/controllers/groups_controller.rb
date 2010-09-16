class GroupsController < ApplicationController
  
  layout "abstract-group"
  
  private
    def load_groups
      @groups = Group.find(:all, :order => 'name')
    end
    def load_new_group
      @group = Group.new(params[:group])
    end
  protected
  public  
    def index
      load_groups
    end
    def new
      load_groups
      load_new_group
    end
    def show
      @group = Group.find(params[:id])
    end
    def edit
      @group = Group.find(params[:id])
      load_groups
    end
    def create
      load_new_group
      if @group.save
        flash[:notice] = "Group successfully created!"
        redirect_to group_path(@group)
      else
        load_groups
        render :new
      end
    end
    def update
      @group = Group.find(params[:id])
      if @group.update_attributes(params[:group])
        flash[:notice] = "Group successfully updated!"
        redirect_to group_path(@group)
      else
        load_groups
        render :edit
      end
    end
    def destroy
      group = Group.destroy(params[:id])
      flash[:notice] = "Group deleted."
      redirect_to groups_path
    end
end