class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
     s = Session.first
     if session.has_key?('login_auth') == false || s.nil?
       puts('No session found (on browser side)')
       redirect_to '/admin'
     elsif session[:login_auth] != s[:session_hash] || session[:otp_hash] != s[:otp_hash]
       puts('Wrong session hash')
       redirect_to '/admin'
     end
     Session.delete_all #Destroys session in database (no longer needed since user verified)
     reset_session #Destroys session in browser
  end

  def new
    @upload= Upload.new
    render layout: false
    #redirect_to new_upload_path
  end
  
  def create
    # creates a new empty model Upload with upload parameters
    @upload= Upload.new(upload_params)
    #render layout: false
    #Save upload parameters into uploads, folders, metadata and contents tables
    if @upload.save
      Folder.new(:folder_title=> @upload.folder_title).save
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
      Content.new(:content_path=> @upload.attachment.url ,
                  :metadatum_id=>Metadatum.maximum(:id),
                  :folder_id=>Folder.maximum(:id)).save
      redirect_to uploads_path, notice: " The file #{@upload.FOIA_ID} is successfully uploaded."
    else
      #renders the view new.html.erb
      render "new"
    end
  end
  
  ## Deletes uploaded file
  # def destroy
  #   @upload = Upload.find(params[:id])
  #   @upload.destroy
  #   redirect_to uploads_path, notice: "The file #{@upload.FOIA_ID} is successfully deleted!"
  # end
  
  private 
  # agrregates upload parameters and makes sure all required upload parameters are present
  def upload_params   
    params.require(:upload).permit(:FOIA_ID,:folder_title,:local_id,:status,:record_collection,:office_origin,:series,:subseries,:box_type,:box_number,:note_field,:attachment)   
  end 
end




