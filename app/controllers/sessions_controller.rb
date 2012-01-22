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
     if(!TokenTweet.where(:tweetId=>key.id).exists? && !(key.nil?) && (key.text.length >30) && ! (key.text.include?("http")) && !(key.text.include?("www.")) )
      #generate random words from vocab table
      @i = 1000+rand(1000);
      @token1=Vocab.find(@i);
      @j=0
      same=true
      while (((@j!=@i)&&(@j==0))|| same)
        @j =1000+rand(1000);
        same= (@token1.word[0]==Vocab.find(@j).word[0])
        #same=(@token1.word[0]==Vocab.find(@j).word[0]) && (@token1.word.length==Vocab.find(@j).word.length) #Will use this when using large vocab table
      end  
      @token2=Vocab.find(@j);

        if ((TokenTweet.first.tweetId||=key.id))
        #save the details in the database
        key.text = key.text.gsub("\n",' ');
        key.text = key.text.strip;
        @saveTokenTweet = TokenTweet.new(:tweetId=>key.id,:category=>1, :tweetText=>key.text,:token1Id=>@i,:token2Id=>@j,:tweetToken1=>@token1.word,:tweetToken2=>@token2.word);
        @saveTokenTweet.save;
        #push in object for view
        @currentTweetArray.push(@saveTokenTweet);
      else
        @currentTweetArray.push((TokenTweet.first.tweetId||=key.id));
      end    
     end
    end
  end
   
  def play
    #@currentTweetArray=TokenTweet.find([1,2,3]);
#=begin
    @count=0;
    @currentTweetArray=[];
    @tweetArray=[];
    @player=Tweeple.where(:id=>session[:tweeple_id]).first;
    #logger.debug "The object is #{@player.id}";
    @tweetArray=TokenTweet.where("done=?",0).all;
    @tweetArray.each do |key|
      #$checkArray=VoteRecord.where("tweeple_id=? AND token_tweet_id=?",@player.id,key.id).all;
      @chk=VoteRecord.where(:tweeple_id=>@player.id,:token_tweet_id=>key.id,).exists?;      
      #logger.debug "#{key.id} #{key.tweetId}?????????? #{@chk}";
      if(!@chk)
        @currentTweetArray.push(key);
        @count+=1;
      else
        #logger.debug "#{@key.id} already done.";
      end
      break if @count==5 
    #logger.debug "The object is #{key.tweetId}";
    end
    #logger.debug "The count is #{@currentTweetArray.size}";
    #logger.debug "The object is #{@tweetArray.size}";
    
    @player=Tweeple.where(:id=>session[:tweeple_id]).first
    @score = @player[:vote];
#=end
  end

=begin
  def filter
    @currentTweetArray=SeedTweet.find(:all);
    @currentTweetArray.each do |key|
      if(!TokenTweet.where(:tweetId=>key.tweetId).exists? && !(key.nil?) && (key.tweetText.length >30) && ! (key.tweetText.include?("http")) && !(key.tweetText.include?("www.")) )
        @saveTokenTweet = TokenTweet.new(:tweetId=>key.tweetId,:category=>key.category, :tweetText=>key.tweetText,:token1Id=>key.token1Id,:token2Id=>key.token2Id,:tweetToken1=>key.tweetToken1,:tweetToken2=>key.tweetToken2,:voteCat1=>0,:voteCat2=>0);
        @saveTokenTweet.save;
      end
    end
  end
=end

  def destroy
    session[:tweeple_id]=nil
    redirect_to root_url, :notice => "Signed Out"
  end
  
  def putToken
   @a=(TokenTweet.where(:tweetId=>params[:tweetId]).first)
   @b=Tweeple.where(:id=>session[:tweeple_id]).first
   logger.debug "The object is #{@a[:id]}";
   @c=VoteRecord.new(:tweeple_id=>@b[:id],:token_tweet_id=>@a[:id],:vote=>params[:cat])
   @b[:vote]+=1;
   @b.save
   @a[:category]=params[:cat]
   if(@a[:voteCat1]==nil)
     @a[:voteCat1]=0;
   end
   if(@a[:voteCat2]==nil)
     @a[:voteCat2]=0;
   end
   if(params[:cat]==0)
     @a[:voteCat1]+=1;
   else
     @a[:voteCat2]+=+1;
   end
   if((@a[:voteCat1] + @a[:voteCat2])>=2)
     @a[:done]=1;
   end
   @a.save
   @c.save  
   
    render :json=>@a
    score();
  end
  
  def score()
  end
end
