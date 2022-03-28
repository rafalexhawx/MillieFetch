require 'rails_helper'

RSpec.describe Folder, type: :model do
  describe 'search_folders' do
    before(:each) do
      searches = Folder.search_folders("Trump's foreign policy")
      @titles = []
      searches.each do |search|
        puts search.name
        @titles.append(search.name)
      end
    end

    it "finds folders that are relevant to the search query" do
      expect(@titles).to include("President Donald J. Trump's Foreign Policy Puts America First",
      "The Hill: The Memo: Tillerson Flap Puts Spotlight ON TRUMP's FOreign POLICY moves",
      "President Donald J. Trump's Foreign Policy Puts America First")
    end

    it "should ignore folders that are completely irrelevant" do
      expect(@titles).not_to include("G20 SUbsidies TOK oil, gas and coal production china",
      "U.S. views on global climate change")
    end
    
  end
end
