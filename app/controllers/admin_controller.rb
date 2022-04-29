require 'digest';
require 'uri';
require 'net/http';
require 'securerandom';
require 'openssl';
require 'base64';

class AdminController < ApplicationController
  def index    #the /admin page
  end

  def otp
    nonce = SecureRandom.alphanumeric(rand(16..40))
    otp = params['otp']
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
end
