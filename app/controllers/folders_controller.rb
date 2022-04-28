class FoldersController < ApplicationController
  #include Pagy::Backend
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index, about]
  before_action :load_cart
  
  def index
    #@folders = Folder.all

  end
  
  def search
    if params[:query].strip.empty?
      #flash[:notice]  = "Enter valid query"
      #redirect_to action: "index", notice: "Enter valid query"
      redirect_to root_path, notice: "Enter valid query"
    elsif  
      search_results = Folder.search_folders(params[:query])
      @searches = Kaminari.paginate_array(search_results).page(params[:page]).per(7)
      #puts @searches
    end
  end
  
  def cart
    @checkout = Folder.find(session[:cart])
    respond_to do |format|
      format.html
      format.zip do
        compressed_filestream = Zip::OutputStream.write_buffer do |zos|
          @checkout.each do |check|
            zos.put_next_entry "MillieFetch/Gemfile"
            zos.print File.open("Gemfile", "r").read
          end
        end
        compressed_filestream.rewind
        send_data compressed_filestream.read, filename: "research.zip"
      end
    end
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
