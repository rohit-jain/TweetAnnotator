class Tweeple < ActiveRecord::Base
  def self.create_with_omniauth(auth)  
    create! do |tweeple|  
      tweeple.provider = auth["provider"]  
      tweeple.uid = auth["uid"]  
      tweeple.name = auth["user_info"]["name"]  
    end  
  end  
end
