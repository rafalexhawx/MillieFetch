class MultiuploadController < ApplicationController
  def index
    @cart = []
    s = Session.first
    if session.has_key?('login_auth') == false || s.nil?
      puts('No session found (on browser side)')
      if s.nil? || session[:login_auth] != s[:session_hash]
        puts('Wrong session hash')
      end
      redirect_to '/admin'
    end
    @upload_multiple = Multiupload.new
  end

  def new
    @upload_multiple = Multiupload.new
    render layout: false
  end
  
  def create    
    p = params[:multiupload]
    files = p[:library_files]
    files.each_with_index do |f, i|
      @upload_multiple = Multiupload.new
      @upload_multiple.series = p[:series]
      @upload_multiple.local_id = p[:local_id]
      @upload_multiple.subseries = p[:subseries]
      @upload_multiple.status = p[:status]
      @upload_multiple.record_collection = p[:record_collection]
      @upload_multiple.office_origin = p[:office_origin]
      @upload_multiple.box_type = p[:box_type]
      @upload_multiple.box_number = p[:box_number]
      @upload_multiple.library_files.attach(f)
      if @upload_multiple.library_files.attached?
        puts "Files attached"
      end
      @upload_multiple.save
    end
      
    redirect_to '/multiform/index'
  end

  
  

  # def destroy
  #   @upload = Upload.find(params[:id])
    
  #   @upload.destroy
  #   redirect_to uploads_path, notice: "The file #{@upload.FOIA_ID} is successfully deleted!"
  # end
  private   
  def upload_params   
    params.require(:multiupload).permit(library_files:  [])   
  end

  

end
