class UploadsController < ApplicationController
  def index
    @cart = []
    @uploads = Upload.all
     s = Session.first
     if session.has_key?('login_auth') == false || s.nil?
       puts('No session found (on browser side)')
       redirect_to '/admin'
     elsif session[:login_auth] != s[:session_hash] || session[:otp_hash] != s[:otp_hash]
       puts('Wrong session hash')
       redirect_to '/admin'
     end
    @mul_uploads = Multiupload.all.length-1
  end

  def new
    @cart = []
    @upload= Upload.new
    #puts "lol"
    render layout: false
    #redirect_to new_upload_path
  end
  
  def create
    @cart = []
    @upload= Upload.new
    #render layout: false

    f = params[:upload][:attachment]
    @upload.attachment.attach(f)
    if @upload.attachment.attached?
      puts "File attached"
    else
      puts 'ERROR IN FILE ATTACHMENT'
      redirect_to uploads_path, notice: "ERROR IN FILE ATTACHMENT"
    end
    Folder.new(:folder_title=> @upload.folder_title).save
    puts 'Folder saved'
    Metadatum.new(:FOIA_ID=> @upload.FOIA_ID,
                  :local_id=> @upload.local_id,
                  :status=> @upload.status,
                  :record_collection=> @upload.record_collection,
                  :office_origin=> @upload.office_origin,
                  :series=> @upload.series,
                  :subseries=> @upload.subseries,
                  :box_type=> @upload.box_type,
                  :box_number=> @upload.box_number,
                  :note_field=> @upload.note_field,
                  :folder_id=> Folder.maximum(:id)).save
    puts "Metadata saved"
    Content.new(:content_path=> url_for(@upload.attachment) ,
                :metadatum_id=>Metadatum.maximum(:id),
                :folder_id=>Folder.maximum(:id)).save
    puts "Content saved"
    redirect_to '/uploads/index', notice: " The file #{@upload.FOIA_ID} is successfully uploaded."
  end

  
  

  # def destroy
  #   @upload = Upload.find(params[:id])
    
  #   @upload.destroy
  #   redirect_to uploads_path, notice: "The file #{@upload.FOIA_ID} is successfully deleted!"
  # end
  private   
  def upload_params   
    params.require(:upload).permit(:FOIA_ID,:folder_title,:local_id,:status,:record_collection,:office_origin,:series,:subseries,:box_type,:box_number,:note_field,:attachment)   
  end 
end




