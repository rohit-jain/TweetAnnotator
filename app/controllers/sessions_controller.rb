class SessionsController < ApplicationController
    def create  
    auth = request.env['omniauth.auth']  
    session[:access_token] = auth['credentials']['token']
    session[:access_secret] = auth['credentials']['secret']
    tweeple = Tweeple.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Tweeple.create_with_omniauth(auth)
    session[:tweeple_id] = tweeple.id  
    #redirect_to root_url, :notice => "Signed In"
    redirect_to "/", :notice => "Signed in!"      
  end  


  def show
    if session[:access_token] && session[:access_secret]
      @user = client.user
    else
      redirect_to root_url, :notice => "Sign in failed!"
    end
  end

  def trend
    @currentTweetArray=[];
    @trend = Twitter::Search.new.q(params[:id]).language("en").result_type("recent").no_retweets.fetch
    @trend.each do |key|
      #generate serials for random words from dictionary
      @i = 976+rand(1899);
      @j=0
      while ((@j!=@i)&&(@j==0))
      @j = 976+rand(1899);
      end
      
      #if tweet previously not in the database, save it with tokens and push it in currentTweetArray for view.
      if ((TokenTweet.first.tweetId||=key.id))
        #get words from the vocab table 
        @token1=Vocab.find(@i);
        @token2=Vocab.find(@j);
        #save the details in the database
        @saveTokenTweet = TokenTweet.new(:tweetId=>key.id,:tweetText=>key.text,:token1Id=>@i,:token2Id=>@j,:tweetToken1=>@token1.word,:tweetToken2=>@token2.word);
        @saveTokenTweet.save;
        #push in object for view
        @currentTweetArray.push(@saveTokenTweet);
      else
        @currentTweetArray.push((TokenTweet.first.tweetId||=key.id));
      end
    end
  end
 
  def destroy
    session[:tweeple_id]=nil
    redirect_to root_url, :notice => "Signed Out"
  end
  
  def putToken
    @a=(TokenTweet.where(:tweetId=>params[:tweetId]).first)
    @a[:category]=params[:cat]
    @a.save
    render :json=>@a
  end
end
