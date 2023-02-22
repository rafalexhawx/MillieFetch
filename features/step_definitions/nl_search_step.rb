
Given('I am on the main page') do
  visit folders_path
end

When('I enter {string} in the search bar') do |string|
  puts string
  fill_in :query, :with => string 
end

When('I click search') do
  click_button "Search"
end

Then('I should be redirected to {string} page') do |string|
  #@searches = "something happened" why does this doesn't re-assign the instance variable
  ## I need to find which I am on and see that is current.path
  #visit 'search'
  expected_path = URI.parse("/folders" + '/' + string).path
  expect(page.current_path).to eq(expected_path)
end

Then('I should see {string}') do |string|
  contain = 0
  #puts string
  page_text = Nokogiri::HTML(page.body).text
  page_data = Nokogiri::HTML.parse(page.body)
  #puts page_text.class
  #puts page_data
  #puts page_data.xpath('//a[@target="_blank"]').to_s
  #puts Array(page_data.xpath('//a/text()'))[0]
  # l = []
  # page_data.xpath('//a/text()').each do |d|
  #   l.append(d.to_s)
  # end
  #puts doc.search('dt').xpath('text()')
  #puts page_data.xpath('//td//a[@target="_blank"]/text()')
  while page_text.include? "Next"
    l = []
    page_data.xpath('//td//a[@target="_blank"]/text()').each do |d|
      l.append(d.to_s)
    end
    if l.include? string
      contain = 1
      print("entered here")
      break
    elsif
      reset = 1
      click_on "Next"
      page_text = Nokogiri::HTML(page.body).text
      page_data = Nokogiri::HTML.parse(page.body)
    end
  end
  puts contain
  expect(contain).to eq(1)
  if reset
    click_on "First"
  end
end

Then('I should see {string} names listed in the results') do |string|
  contain = 0
  #puts string
  page_text = Nokogiri::HTML(page.body).text
  page_data = Nokogiri::HTML.parse(page.body)
  
  while page_text.include? "Next"
    l = []
    page_data.xpath('//td//a[@target="_blank"]/text()').each do |d|
      l.append(d.to_s)
    end
    if l.include? string
      contain = 1
      print("entered here")
      break
    elsif
      reset = 1
      click_on "Next"
      page_text = Nokogiri::HTML(page.body).text
      page_data = Nokogiri::HTML.parse(page.body)
    end
  end
  puts contain
  expect(contain).to eq(1)
  if reset
    click_on "First"
  end
end

Then('I should not see {string}') do |string|
  contain = 0
  #puts string
  page_text = Nokogiri::HTML(page.body).text
  page_data = Nokogiri::HTML.parse(page.body)
  
  while page_text.include? "Next"
    l = []
    page_data.xpath('//td//a[@target="_blank"]/text()').each do |d|
      l.append(d.to_s)
    end
    if l.include? string
      contain = 1
      print("entered here")
      break
    elsif
      reset = 1
      click_on "Next"
      page_text = Nokogiri::HTML(page.body).text
      page_data = Nokogiri::HTML.parse(page.body)
    end
  end
  puts contain
  expect(contain).to eq(0)
  if reset
    click_on "First"
  end
end
  
Then('I should not see {string} names in the results') do |string|
  contain = 0
  #puts string
  page_text = Nokogiri::HTML(page.body).text
  page_data = Nokogiri::HTML.parse(page.body)
  
  while page_text.include? "Next"
    l = []
    page_data.xpath('//td//a[@target="_blank"]/text()').each do |d|
      l.append(d.to_s)
    end
    if l.include? string
      contain = 1
      print("entered here")
      break
    elsif
      reset = 1
      click_on "Next"
      page_text = Nokogiri::HTML(page.body).text
      page_data = Nokogiri::HTML.parse(page.body)
    end
  end
  puts contain
  expect(contain).to eq(0)
  if reset
    click_on "First"
  end
end

