require 'digest'
require 'pp'

class LoginController < ApplicationController
  def view
    #render layout: false
    @cart = []
    s = Session.first
    if session.has_key?('login_auth') == false || s.nil?
      puts('No session found (on browser side)')
      if s.nil? || session[:login_auth] != s[:session_hash]
        puts('Wrong session hash')
      end
      redirect_to '/admin'
    end
  end

  def verify
    @username = params['username']
    @p = params[:password]
    salt = "$2a$12$wtuYetyze2U24iIEvOGb3O" #MUST FIND WAY TO OBFUSCATE THIS PART

    @p_verif = Account.where(username: @username).first
    pp @p_verif
    if @p_verif.nil? == true #Username does not exist in database
      puts("Username not found")
      flash[:warning] = "Wrong username or password"
      redirect_to '/admin' 
      return
    end
    #pp @p_verif
    @hex = Digest::SHA256.hexdigest(@p)
    @hex = BCrypt::Engine.hash_secret(@hex, salt)
    @verif = @hex == @p_verif[:password_digest]
    if @verif #Username and password are correct
      session[:login_auth] = Digest::SHA256.hexdigest(params[:authenticity_token])
      Session.create(session_hash: Digest::SHA256.hexdigest(params[:authenticity_token]), otp_hash: "")
      redirect_to '/login_otp' 
    else
      flash[:warning] = "Wrong username or password"
      redirect_to '/admin' 
    end

  end
end
