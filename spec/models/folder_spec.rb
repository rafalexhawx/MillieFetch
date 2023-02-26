require 'rails_helper'

RSpec.describe Folder, type: :model do
  describe 'search_folders' do
    before(:each) do
      searches = Folder.search_folders("briefings on national security")
      @titles = []
      searches.each do |search|
        #puts search.
        #c = search.contents
        #puts c.inspect
        @titles.append(search.folder_title)
      end
    end

    it "finds folders that are relevant to the search query" do
      expect(@titles).to include("NSB's [National Security Briefings] (1989 - 1993) [8]",
      "NSB's [National Security Briefings] (1989 - 1993) [4]",
      "NSB's [National Security Briefings] (1989 - 1993) [7]")
    end

    it "should ignore folders that are completely irrelevant" do
      expect(@titles).not_to include("Desert Shield/Desert Storm (November 1990) [1]",
      "Soviet Power Collapse in Eastern Europe (February - March 1990)", 
      "Latin America - Economics (November - December 1990)")
    end
    
  end
end
