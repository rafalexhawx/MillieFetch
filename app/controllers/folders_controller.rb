class FoldersController < ApplicationController
  def index
  end
  
  def search
    if params[:query]
      @phrase = params[:query]
    else
      @phrase = "no happened"
    end
  end
end
