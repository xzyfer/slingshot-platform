require 'oauth'
require 'twitter'


module Slingshot
  module Helpers
    class Twitter

      def credentials
        @credentials ||= YAML.load_file("twitter_credentials.yml")
      end

      def options
        @opts ||= {
          :site => "http://api.twitter.com/"
        }
      end

      def authorize_url
        oauth = OAuth::Consumer.new(credentials[:consumer_key],
                                    credentials[:consumer_secret],
                                    options)
        token_request = oauth.get_request_token()
        token_request.authorize_url
      end

    end
  end
end

def twitter
  @twitter_helper ||= Slingshot::Helpers::Twitter.new
end
