class FoldersController < ApplicationController
  def index
  end
  
  def search
    if params[:query]
      @searches = Folder.all
    else
      @searches = "no happened"
    end
  end
end
