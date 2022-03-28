class FoldersController < ApplicationController
  def index
  end
  
  def search
    @searches = Folder.search_folders(params[:query])
  end

end
