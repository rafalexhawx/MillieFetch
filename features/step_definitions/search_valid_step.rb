# Given('I am on the main page') do
#     visit folders_path
#   end

# When('I click search') do
#     click_button "Search"
# end

Then('I should be prompted {string}') do |string|
    page.should have_content string
end

Then('I should be redirected to the main page') do
    expected_path = URI.parse("/").path
    expect(page.current_path).to eq(expected_path)
  end
  

