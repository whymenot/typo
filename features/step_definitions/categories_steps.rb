Then /^(?:|I )should be going to new admin category page/ do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/admin/categories/new"
  else
    assert_equal "/admin/categories/new", current_path
  end
end


