require 'spec_helper'

describe "groups/show.html.erb" do
  before(:each) do
    assign(:group, mock_group({
      :name => "Groupie Group",
      :registered_memberships => [],
      :members => []
    }))
  end
  it "displays group details" do
    render
    rendered.should =~ /Groupie Group/
    rendered.should =~ /Memberships: 0/
  end
end
