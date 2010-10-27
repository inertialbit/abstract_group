class MembershipsController < AbstractGroup::ApplicationController
  
  layout 'abstract-group'
  
  before_filter :load_group
  
  rescue_from ActiveRecord::RecordInvalid, :with => :invalid_record

  include ActionView::Helpers::TextHelper # for pluralize in #create
  
  private
    def invalid_record(e)
      if action_name == 'create'
        flash.now[:notice] = "A processing error occurred while attempting "+
                             "to create the selected memberships."
                             
        
        @groups = Group.all
        @members = Groupable.types.collect do |type|
          type.send(:find, :all)
        end.flatten
        render :new
      end
    end
    def load_group
      if params[:group_id]
        @group = Group.find(params[:group_id])
      else
        redirect_to(groups_path, {
          :notice => "Which group does the new membership apply to?"
        })
      end
    end
  protected
  public
    def new
      @membership = Membership.new
      @groups = Group.all
      @members = Groupable.types.collect do |type|
          type.send(:find, :all)
      end.flatten
    end
    def create
      memberships = Member.create!(params[:membership])
      redirect_to(groups_path, {
        :notice => "Created #{pluralize(memberships.count, 'Membership')}!"
      })
    end
end
