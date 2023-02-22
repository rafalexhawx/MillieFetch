class ReceiptController < ApplicationController
  def index
    
    @m = ["FOIA_ID", "local_id", "status", "record_collection", "office_origin", "series", "subseries", "box_type", "box_number", "note_field"]
    begin
      @cart = Folder.find(session[:cart])
    rescue
      @cart = []
      puts "Error avoided"      
    end
    @meta = Metadatum.find(session[:cart])
    @contents = Content.find(session[:cart])
    render layout: false
  end
end
