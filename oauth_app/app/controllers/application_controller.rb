class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception

	# 【signed_in?】サインしているかどうか
	def signed_in?
		true if session[:oauth_token]
	end

	# 【follower】フォロアーの一覧
	helper_method :follower
		def follower
			result = Hash.new { |hash, key| hash[key] = [] }
		if current_user
 			set
			@client.follower_ids().each_slice(100).each do |slice|
				@client.users(slice).each do |a|
					result.store(a.id.to_s,[a.name.to_s,a.screen_name.to_s])
				end
		  	end
			return result
		end
	end
	
	# 【friend】フォローの一覧
	helper_method :friend
		def friend
			result = Hash.new { |hash, key| hash[key] = [] }
		if current_user
 			set
			@client.friend_ids().each_slice(100).each do |slice|
				@client.users(slice).each do |a|
					result.store(a.id.to_s,[a.name.to_s,a.screen_name.to_s])
				end
		  	end
			return result
		end
	end
 
	# 【set】twitterアカウントの設定
	def set
		@client = Twitter::REST::Client.new(
			consumer_key:        Settings.twitter.consumer_key,
			consumer_secret:     Settings.twitter.consumer_secret,
			access_token:        session[:oauth_token],
			access_token_secret: session[:oauth_token_secret],
		)
	end
	# 【dm_sent】DMの送信

			# ('dark tokaton2', "テストです\n改行します") 



end






