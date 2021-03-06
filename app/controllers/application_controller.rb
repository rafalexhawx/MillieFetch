class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
end
