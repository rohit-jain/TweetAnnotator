class Tweeple < ActiveRecord::Base
has_many :vote_records
  def self.create_with_omniauth(auth)  
    create! do |tweeple|  
      tweeple.provider = auth["provider"]  
      tweeple.uid = auth["uid"]  
      tweeple.name = auth["user_info"]["name"]  
    end  
  end  
end
