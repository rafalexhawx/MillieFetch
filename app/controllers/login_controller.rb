require 'digest'
require 'pp'

class LoginController < ApplicationController
  def view
    s = Session.first
    if session.has_key?('login_auth') == false || s.nil?
      puts('No session found (on browser side)')
      redirect_to '/admin'
    elsif session[:login_auth] != s[:session_hash]
      puts('Wrong session hash')
      redirect_to '/admin'
    end
  end

  def verify
    @username = params['username']
    @p = params[:password]
    salt = "$2a$12$wtuYetyze2U24iIEvOGb3O" #MUST FIND WAY TO OBFUSCATE THIS PART
    
    @p_verif = Account.where(username: @username).first
    @hex = Digest::SHA256.hexdigest(@p)
    @hex = BCrypt::Engine.hash_secret(@hex, salt)
    @verif = @hex == @p_verif[:password_digest]
    if @verif
      session[:login_auth] = Digest::SHA256.hexdigest(params[:authenticity_token])
      Session.create(session_hash: Digest::SHA256.hexdigest(params[:authenticity_token]), otp_hash: "")
      redirect_to '/login_otp' 
    else
      puts("If you reach this line, this means it failed")
      render js: "alert('Wrong username or password')"
    end
    
  end
end
