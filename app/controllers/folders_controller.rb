class FoldersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index, about]
  before_action :load_cart
  
  def index
    @folders = Folder.all
  end
  
  def search
    if params[:query].strip.empty?
      flash[:notice]  = "Enter valid query"
      redirect_to action: "index"
    elsif
      @searches = Folder.search_folders(params[:query])
    end
  end
  
  def cart
  end
  
  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless[:cart].include?(id)
    session[:cart] = session[:cart].uniq
    redirect_back_or_to root_path, notice: "The folder is added to your cart!"
  end
  
  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_back_or_to root_path, notice: "The folder is removed from your cart!"
  end
  
  private 
  
  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||=  []
  end 
  
  def load_cart
    @cart = Folder.find(session[:cart])
  end
    
  
  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

end
