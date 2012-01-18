
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private  

  def client
    Twitter.configure do |config|
      config.consumer_key = "AEmV4waNSUSYpPIFHvpR2g"
      config.consumer_secret = "mQ4Z95q2fQraZCijrbFzX7GhZlZH7khunc6cnyzSf8"
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end
  
   def signed_in?        
    session[:access_token] && session[:access_secret]
   end
   
  def current_user
    if signed_in? and session[:tweeple_id]
    @current_user ||= Tweeple.find(session[:tweeple_id]) if session[:tweeple_id]
    @user = client.user  
    end
  end

  def user
    if signed_in? 
    @user = client.user
    end
  end

  
  helper_method :client , :signed_in? , :current_user , :user
  
end
