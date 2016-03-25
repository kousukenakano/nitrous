namespace :twitter do
  desc "ツイート関係"

  # 現在の時刻をツイート
  task :nowtimetweet => :environment do
    set
    timNow = Time.now + 9*60*60 #　時差９時間を加算
    strMes = timNow.strftime("今は %Y年%m月%d日 %H時%M分%S秒です") 
    @client.update(strMes)  
  end    
 
  # フォローの一覧を表示  
  task :friend => :environment do
    set
    @client.friend_ids().each_slice(100).each do |slice|
      @client.users(slice).each do |a|
        printf("ID:%s NAME:\"%s\"\n",a.id, a.name)
      end
    end
  end 
  
  # フォロワーの一覧を表示  
  task :follower => :environment do
    set
    @client.follower_ids().each_slice(100).each do |slice|
      @client.users(slice).each do |a|
        printf("ID:%s NAME:\"%s\"\n",a.id, a.name)
      end
    end
  end   
  
  
  # twitterアカウントの設定
  def set
    @client = Twitter::REST::Client.new do |config|
         config.consumer_key        =  "fF9LChLpHRLAFBLEE0x9QcLUv"
         config.consumer_secret     =  "EqJ4MhR1zvI8BIdNZulXuBjDkTKAMtj91p5vwogOR1F6OqsYbI"
         config.access_token        =  "248186799-1QoDTt4b7lMHWtI0M0Cf2ofOYMPP5bvuJLWCbN7z"
         config.access_token_secret =  "x6daJpHLtmViNf9Ti8d1syGIakMMYh5i7ywiCe6y3ydkM"
    end
  end
  
end
