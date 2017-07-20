require 'oauth'

class OauthController < ApplicationController
    def get_twitter_oauth_url
      consumer = OAuth::Consumer.new(
        Oauth::QtoIuqnXzNvB5fj8Su2tASXaV,
        Oauth::B9zL5AtlWNifA2NC1nRjhJHCKLXja54FNJHXrieSHUwrEE2a1s,
        { :site => "https://api.twitter.com" }
      )
  
      request_token = consumer.get_request_token(
        :oauth_callback => "http://localhost:3000/oauth_twitter"
      )
  
      cookies[:request_token] = request_token.token
      cookies[:request_token_secret] = request_token.secret
  
      rtn = {}
      rtn["status"] = true
      rtn["oauth_url"] = request_token.authorize_url
  
      render json: rtn
    end
end
