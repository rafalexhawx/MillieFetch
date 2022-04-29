class UploadController < ApplicationController
  def view
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
end