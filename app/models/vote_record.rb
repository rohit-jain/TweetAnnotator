class VoteRecord < ActiveRecord::Base
  belongs_to :tweeple
  belongs_to :token_tweet
end
