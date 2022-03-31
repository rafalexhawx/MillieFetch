require 'rails_helper'
#require 'spec_helper'
RSpec.describe "Folders", type: :request do
  describe "GET /search" do
    it "should assign the model search results to @searches" do
        searches = double(Folder).as_null_object
        expect(Folder).to receive(:search_folders).with("Trump's foreign policy").and_return(searches)
        #expect(Folder).to receive(:search_folders).with("Trump's foreign policy")
        get("/folders/search", params:{query: "Trump's foreign policy"})
        expect(assigns(:searches)).to eq(searches)
    end
  end
end
