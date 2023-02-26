require 'digest';
require 'uri';
require 'net/http';
require 'securerandom';
require 'openssl';
require 'base64';

class AdminController < ApplicationController
  def index    #the /admin page
      #render layout: false
      @cart = []
  end

  def otp
    nonce = SecureRandom.alphanumeric(rand(16..40))
    otp = params['otp']
    if otp.nil? or otp.length == 0
      redirect_to '/admin', notice: "Wrong Yubikey OTP"
    end
    id = 74032 #OBFUSCATE THIS AS WELL
    uri = URI("https://api.yubico.com/wsapi/2.0/verify?id=#{id}&nonce=#{nonce}&otp=" + otp)
    res = Net::HTTP.get_response(uri)
    data = res.body.split()
    hash = data[0][2...-1]
    parsed = {
      :time => data[1],
      :status => data[5],
      :sl => data[4],
      :nonce => data[3],
      :hash => data[0],
      :otp => data[2]
    }
    
    if parsed[:status] == 'status=OK' #yubikey returns positively
      Session.update(:otp_hash => Digest::SHA256.hexdigest(parsed[:hash]))
      session[:otp_hash] = Digest::SHA256.hexdigest(parsed[:hash])
    end

    return render json: parsed
  end

  def logoff
    Session.delete_all #Destroys session in database (no longer needed since user verified)
    reset_session #Destroys session in browser
    redirect_to '/admin', notice: " Admin logged off"
  end

end
