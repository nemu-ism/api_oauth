require 'oauth'

class OauthController < ApplicationController
    def get_twitter_oauth_url

      consumer_key = "QtoIuqnXzNvB5fj8Su2tASXaV"
      consumer_secret = "B9zL5AtlWNifA2NC1nRjhJHCKLXja54FNJHXrieSHUwrEE2a1s"

      consumer = OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
        { :site => "https://api.twitter.com" }
      )
  
      request_token = consumer.get_request_token(
        :oauth_callback => "http://localhost:3000/oauth_twitter"
      )
  
      rtn = {}
      rtn["status"] = true
      rtn["oauth_url"] = request_token.authorize_url
  
      render json: rtn
    end
end
