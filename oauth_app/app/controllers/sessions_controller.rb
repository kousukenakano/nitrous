class SessionsController < ApplicationController

  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    
    #追加
#    session[:username] = auth.access_token.params[:screen_name]
    session[:consumer_key] = Settings.twitter.consumer_key
    session[:consumer_secret] = Settings.twitter.consumer_secret
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    #
    
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
