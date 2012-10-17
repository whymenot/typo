Given /the following article exists/ do |tb|
  tb.hashes.each do |t|
  	Article.create!(t)
  end
end
