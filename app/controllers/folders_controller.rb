require 'net/http';


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
      redirect_to root_path, notice: "Enter valid query"
    elsif  
      search_results = Folder.search_folders(params[:query])
      @searches = Kaminari.paginate_array(search_results).page(params[:page]).per(7)
    end
  end

  def display_url
    if params[:folder_id]
      docs = Content.where(folder_id:params[:folder_id])
      redirect_to docs.collect(&:content_path)[0]
    end
  end
  
  def cart
    @checkout = Folder.find(session[:cart])
    respond_to do |format|
      format.html
      format.zip do
        compressed_filestream = Zip::OutputStream.write_buffer do |zos|
          @checkout.each do |check|
            s = Content.where(folder_id:check.id)[0][:content_path]
            pp s
            if s.nil? 
              next
            end
            
            path_to_file = "http://127.0.0.1#{s}"
                       
            s = s.split('/')[-1]
            zos.put_next_entry "MillieFetch/#{s}"
            #zos.print File.open("#{Content.where(folder_id:check.id).collect(&:content_path)[0]}", "r").read
            #Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true).read
            
            r = internal_request(path_to_file)[2].body
            link = r.split('<')[3].split('"')[1]
            
            #pdf=HTTParty.get(link)
            pdf = internal_request(link)[2]
            
            pp pdf
            file_to_write = pdf.to_path
            zos.print File.open(file_to_write).read
          end
          

          
          zos.put_next_entry "MillieFetch/ResearchReceipt.html"
          zos.print generate_receipt
        end
        compressed_filestream.rewind
        send_data compressed_filestream.read, filename: "research.zip"
      end
    end
  end

  def internal_request(path, params={})
    request_env = Rack::MockRequest.env_for(path, params: params.to_query).merge({
      'rack.session' => session  # remove if session is unavailable/undesired in request
    })
  
    # Returns: [ status, headers, body ]
    return Rails.application.routes.call(request_env)
  end

  def generate_receipt
    intern = internal_request('receipt/index')[2].body
    return intern
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
    begin
      @cart = Folder.find(session[:cart])
    rescue
      @cart = []
      puts "Error avoided"      
    end
  end
    
  
  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

end
