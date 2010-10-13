def loads_groups(&block)
  mock_group
  Group.should_receive(:find).and_return([@group])
  yield
  assigns[:groups].should eql [@group]
end
