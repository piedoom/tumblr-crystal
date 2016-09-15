require "oauth"
require "http/client"
require "uri"

# very, very broken.
module Tumblr
  class Client

    Host = "api.tumblr.com"

    # create a new client with oauth support
    def initialize(
      consumer_key : String, 
      consumer_secret : String, 
      oauth_token : String, 
      oauth_token_secret : String)

      # create some nifty oauth stuff
      consumer = OAuth::Consumer.new(Host, consumer_key, consumer_secret)
      token = OAuth::AccessToken.new(oauth_token, oauth_token_secret)

      @http_client = HTTP::Client.new(Host)
      consumer.authenticate(@http_client, token)
    end

    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#
    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#
    #~*~*~*~ USER METHODS *~*~*~*~*#
    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#
    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#

    # get all info pertaining to the currently signed in user
    def get_user_info
      get("/v2/user/info")
    end




    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#
    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#
    #~*~ INTERNAL HTTP METHODS ~*~*#
    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#
    #~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*#

    # generic function for getting JSON
    private def get(path : String, params = {} of String => String)

      # add parameters to our string
      path += "?#{to_query_params(params)}"  unless params.empty?

      # finally, get our response
      response = @http_client.get(path)

      # handle the response properly and check for errors
      handle_response(response)
    end

    private def handle_response(response : HTTP::Client::Response)
      case response.status_code
      when 200..299
        response.body
      else
        raise "error" # TODO: more error checking
      end
    end

    # returns a URL encoded string used for query parameters
    private def to_query_params(params : Hash(String, String))
      HTTP::Params.build do |form_builder|
        params.each do |key, value|
          form_builder.add(key, value)
        end
      end
    end

  end
end
