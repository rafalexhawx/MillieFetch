class MultiformController < ApplicationController
  def index

    @cart = []
    s = Session.first
    if session.has_key?('login_auth') == false || s.nil?
      puts('No session found (on browser side)')
      if s.nil? or session[:login_auth] != s[:session_hash]
        puts('Wrong session hash')
      end
      redirect_to '/admin' and return
    end
    @all_uploads = Multiupload.all
    pp @all_uploads

    if @all_uploads.length == 1
      Multiupload.all.delete_all
      redirect_to '/uploads/series', notice: "No files to upload" and return
    end

    
    @new_uploads = Upload.new

    #pp @new_uploads
  end

  def create
    @upload = Upload.new
    puts params[:new_uploads]
    Folder.new(:folder_title=> params[:new_uploads]['folder_title']).save
    Metadatum.new(:FOIA_ID=> params[:new_uploads]['FOIA_ID'],
                    :local_id=> params[:new_uploads]['local_id'],
                    :status=> params[:new_uploads]['status'],
                    :record_collection=> params[:new_uploads]['record_collection'],
                    :office_origin=> params[:new_uploads]['office_origin'],
                    :series=> params[:new_uploads]['series'],
                    :subseries=> params[:new_uploads]['subseries'],
                    :box_type=> params[:new_uploads]['box_type'],
                    :box_number=> params[:new_uploads]['box_number'],
                    :note_field=> params[:new_uploads]['note_field'],
                    :folder_id=> Folder.maximum(:id)).save
      Content.new(:content_path=> url_for(params[:new_uploads]['attachment']),
                  :metadatum_id=>Metadatum.maximum(:id),
                  :folder_id=>Folder.maximum(:id)).save
      Multiupload.find(params[:new_uploads]['id'].to_i).delete
      redirect_to '/multiform/index', notice: " File #{params[:new_uploads]['FOIA_ID']} is successfully uploaded."
    #redirect_to '/uploads/index'
  end

  
end
