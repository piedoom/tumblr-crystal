require "cossack"
require "json"
require "./blog"

module Tumblr

  # we will also have a `Client` class in the authenticated Tumblr library, 
  # so it's best to separate the two using modules.
  module Simple

    # client allows us to perform 
    # unauthenticated requests to the V1 tumblr API
    class Client

      # Gets all info from a user blog, including post counts and posts.
      # Uses the blog username without any extra symbols
      # Correct: `get_all('myblog')`
      # Incorrect: `get_all('myblog.tumblr.com')
      # Tumblr's V1 API is is a little wonky, so we can't really set a constant to a generic base route.
      # Tumblr uses the following format - `http://BLOG_NAME.tumblr.com/api/read/json`
      # We also only have that one endpoint, so all other methods besides the following are just helpers, really.
      def self.get_all(blog : String)


        cossack = Cossack::Client.new do |client|
          # follow up to 10 redirections (by default 5)
          client.use Cossack::RedirectionMiddleware
        end

        # get our "JSON" - 
        # this isn't actually pure JSON, as Tumblr wraps it in a JavaScript variable for some odd reason.
        response_js =  cossack.get("http://#{blog}.tumblr.com/api/read/json?callback=\"\"").body

        
        # We got rid of most of it by providing the `callback=''` parameter, but there's still a `);` at the end
        # of our response.  We can do a substring to get rid of this.
        response = response_js[1..response_js.size - 3]

        # lets parse our JSON
        json = JSON.parse(response)

        # map our JSON to some objects and return
        return Blog.new(json)

      end
    end
  end
end