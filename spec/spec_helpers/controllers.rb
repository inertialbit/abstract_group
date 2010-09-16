def loads_groups(&block)
  Group.should_receive(:find).and_return([mock_group])
  yield
  assigns[:groups].should eql [mock_group]
end
