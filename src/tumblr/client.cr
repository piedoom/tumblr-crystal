require "oauth"
require "http"
require "uri"

# very, very broken.
module Tumblr
  class Client

    Host = "api.tumblr.com/v2"

    property consumer : OAuth::Consumer
    property token : OAuth::AccessToken

    # create a new client with oauth support
    def initialize(
      consumer_key : String, 
      consumer_secret : String, 
      oauth_token : String, 
      oauth_token_secret : String)

      # create some nifty oauth stuff
      @consumer = OAuth::Consumer.new(Host, consumer_key, consumer_secret)
      @token = OAuth::AccessToken.new(oauth_token, oauth_token_secret)

      @http_client = HTTP::Client.new(Host)
      @consumer.authenticate(@http_client, @token)
    end

    def get(path : String, params = {} of String => String)
        path += "?#{to_query_string(params)}" unless params.empty?
        response = @http_client.get(path)
        #handle_response(response)
    end

    def post(path : String, form = {} of String => String)
      response = @http_client.post_form(path, form)
      #handle_response(response)
    end

    def get_user_info
      puts get("/user/info")
    end

    private def to_query_string(hash : Hash)
      HTTP::Params.build do |form_builder|
        hash.each do |key, value|
          form_builder.add(key, value)
        end
      end
    end
  end
end
