class FoldersController < ApplicationController
  def index
  end
  
  def search
    if params[:query]
      @seaches = Folder.all
    else
      @phrase = "no happened"
    end
  end
end
