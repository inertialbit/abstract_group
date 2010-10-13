require 'spec_helper'

describe "groups/new.html.erb" do
  before(:each) do
    mock_group({
      :name => "Groupie Group"
    })
    assign(:groups, [@group])
    assign(:group, mock_new_group({
      :group_ids => [],
      :name => nil
    }))
    view.stub(:abstract_group).and_return(self)
  end
  it "renders a Group form" do
    render
    rendered.should =~ /Group/
    rendered.should =~ /Name/
  end
end
