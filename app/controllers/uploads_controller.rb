class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload= Upload.new
  end
  

  def create
    @upload= Upload.new(upload_params)
    if @upload.save
      redirect_to uploads_path, notice: " The file #{@upload.FOIA_ID} is successfully uploaded"
    else
      render "new"
    end
  end
  

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to uploads_path, notice: "The file #{@upload.FOIA_ID} is successfully deleted!"
  end
  private   
    def upload_params   
    params.require(:upload).permit(:FOIA_ID,:folder_title,:local_id,:status,:record_collection,:office_origin,:series,:subseries,:box_type,:box_number,:note_field,:attachment)   
  end 
end


