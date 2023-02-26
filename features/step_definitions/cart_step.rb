
Given('The user is on the main page') do
  visit folders_path
end

# Given('The user is on the Cart page') do
#   visit folders_cart_path
# end

When('The user enters {string} in the search bar') do |string|
  puts string
  fill_in :query, :with => string 
end

When('The user clicks search button') do
  click_button "Search"
end

When('The user clicks the Cart button in the navigation bar') do
  click_link "My Cart"
end

When('The user clicks add button of a first folder') do
  click_link("add to cart", :match => :first)

end

When('The user clicks remove button of the folder in the cart.') do
  click_link("Remove")
end

Then('A yellow notice that says {string} is seen below the navigation bar') do |string|
    page.should have_content string
end

Then('The user should see {string} in the cart') do |string|
  page.should have_content string
end

Then('The user should not see {string} in the cart') do |string|
    page.should have_no_content string
  end
