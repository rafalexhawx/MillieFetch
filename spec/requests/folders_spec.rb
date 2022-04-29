require 'rails_helper'
#require 'spec_helper'
RSpec.describe "Folders", type: :request do
  describe "GET /search" do
    it "the folder model's search function should get triggered with given valid query" do
        search_results = double(Array).as_null_object
        expect(Folder).to receive(:search_folders).with("soviet's loss of power in eastern europe").and_return(search_results)
        get("/folders/search", params:{query: "soviet's loss of power in eastern europe", page: 1})
    end
    context "the records being shown in pages should be correct" do
      before do
        @search_results = Folder.search_folders("soviet's loss of power in eastern europe")
        total_results = @search_results.length
        @total_pages = total_results/7
        @total_pages = @total_pages.ceil
      end
      it "the number of records shown in pages should be correct" do
        (1..@total_pages).each do |p|
          get("/folders/search", params:{query: "soviet's loss of power in eastern europe", page: p})
          a = (p - 1)*7
          b = p*7 - 1
          expect(assigns(:searches)).to eq(@search_results[a..b])
        end
        
      end
      # it "the number of records shown in pages should be correct" do
      #   get("/folders/search", params:{query: "soviet's loss of power in eastern europe", page: 2})
      #   expect(assigns(:searches).length).to eq(7)
      # end
    end
    it "should redirect to root page when the search query is invalid" do
      get("/folders/search", params:{query: "", page: 1})
      expect(response).to redirect_to(root_path)
    end


    # it "results from the folder model's search should be paginated" do
    #     #c = Folder.search_folders("soviet's loss of power in eastern europe")
    #     search_results = double(Folder, search_folders: c)
    #     #allow(Folder).to receive(:search_folders).with("soviet's loss of power in eastern europe").and_return(search_results)
    #     #search_results = allow(Folder).to receive(:search_folders).with("soviet's loss of power in eastern europe")
    #     #puts search_results.class
    #     #c = Kaminari.paginate_array(search_results)
    #     puts search_results.search_folders
    #     #puts c
    #     expect(Kaminari).to receive(:paginate_array).with(search_results.search_folders)
    #     get("/folders/search", params:{query: "soviet's loss of power in eastern europe", page: 1})
    #     # m = Folder.search_folders("soviet's loss of power in eastern europe")
    #     # puts m.class
    # end
    # it "should assign the model search results to @searches" do
    #     search_results = double(Folder).as_null_object
    #     expect(Folder).to receive(:search_folders).with("soviet's loss of power in eastern europe").and_return(search_results)
    #     #expect(Kaminari).to receive(:paginate_array).with(search_results)
    #     #expect(Folder).to receive(:search_folders).with("Trump's foreign policy")
    #     m = Folder.search_folders("soviet's loss of power in eastern europe")
    #     c = Kaminari.paginate_array(m).page(1).per(7)
    #     #puts search_results
    #     get("/folders/search", params:{query: "soviet's loss of power in eastern europe", page: 1})
    #     #puts search_results
    #     #puts c
    #     #puts :searches
    #     expect(assigns(:searches)).to eq(search_results)
    #end
  end
end
