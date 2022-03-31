class FoldersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index, about, search]
  
  def index
    @folders = Folder.all
  end
  
  def search
    @searches = Folder.search_folders(params[:query])
    @folders = Folder.all
  end
  
  def about
  end
  
  def add_to_cart
    session[:cart] << params[:id]
    redirect_to :back
  end
  
  private 
  
  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end 
  
  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
