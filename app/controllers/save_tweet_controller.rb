class SaveTweetController < ApplicationController
  def create
    params[:tweets_id].each do |id|
      @save_tweet = Usertweet.new(:uid => session[:tweeple_id],:tweetid => id)
      @save_tweet.save
    end
    redirect_to root_url
  end
end
