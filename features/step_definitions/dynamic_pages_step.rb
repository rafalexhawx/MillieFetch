
Then('I should land by default in page {int}') do |int|
    page_data = Nokogiri::HTML.parse(page.body)
    active_tag = page_data.xpath('//li[@class="page-item active"]')
    expect(active_tag.at('a').text).to eq(int.to_s)
end
    
When('I click {string} button on the page navigator') do |string|
    click_on string
end
    
Then('I should see the {string} page with page {int} results') do |string, int|

    expected_path = URI.parse("/folders" + '/' + string).path
    expect(page.current_path).to eq(expected_path)

    uri = URI.parse(page.current_url)
    params = Hash[URI.decode_www_form uri.query]
    
    expect(params["page"]).to eq(int.to_s)
    #puts page.body

end

Then('I should be on the {string} page with page {int} results') do |string, int|
    expected_path = URI.parse("/folders" + '/' + string).path
    expect(page.current_path).to eq(expected_path)

    page_data = Nokogiri::HTML.parse(page.body)
    active_tag = page_data.xpath('//li[@class="page-item active"]')
    expect(active_tag.at('a').text).to eq(int.to_s)

end