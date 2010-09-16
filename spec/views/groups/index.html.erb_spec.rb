require 'spec_helper'

describe "groups/index.html.erb" do
  before(:each) do
    assign(:groups, [double(Group, {
      :name => "Groupie Group",
      :members => []
    })])
  end
  it "displays a listing of saved groups" do
    render
    rendered.should =~ /Groupie Group/
  end
end
