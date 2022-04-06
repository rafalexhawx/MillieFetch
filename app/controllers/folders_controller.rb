class FoldersController < ApplicationController
  def index
  end
  
  def search
    if params[:query].strip.empty?
      flash[:notice]  = "Enter valid query"
      redirect_to action: "index"
    elsif
      @searches = Folder.search_folders(params[:query])
    end
  end

end
