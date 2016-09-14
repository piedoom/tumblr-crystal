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

      # get everything from a user-blog
      def self.get_all(
        blog : String, 
        offset : Int32? = nil,
        amount : Int32? = nil,
        post_type : PostType? = nil)

        return get(blog, offset, amount, post_type)
      end

      # get only posts
      def self.get_posts(
        blog : String,
        offset : Int32? = nil,
        amount : Int32? = nil,
        post_type : PostType? = nil)

        return get(blog, offset, amount, post_type).posts
      end   

      # Gets a singular post by ID
      def self.get_post(
        blog : String,
        id : Int64)

        result = get(blog: blog, id: id)
        return result.posts.first
      end

      # Gets all info from a user blog, including post counts and posts.
      # Uses the blog username without any extra symbols
      # Correct: `get_all('myblog')`
      # Incorrect: `get_all('myblog.tumblr.com')
      # Tumblr's V1 API is is a little wonky, so we can't really set a constant to a generic base route.
      # Tumblr uses the following format - `http://BLOG_NAME.tumblr.com/api/read/json`
      # We also only have that one endpoint, so all other methods besides the following are just helpers, really.
      private def self.get(
        blog : String, 
        offset : Int32? = nil,
        amount : Int32? = nil,
        post_type : PostType? = nil,
        id : Int64? = nil)
        
        # intialize some variables
        parameters = Hash(String, String).new
        params_str = String.new

        # assemble all of our parameters
        parameters["id"] = id.to_s unless id.nil?
        parameters["start"] = offset unless offset.nil?
        parameters["num"] = amount.to_s unless amount.nil?
        parameters["type"] = post_type unless post_type.nil?
        parameters["callback"] = "\"\""

        # add some strings to our params_str to build our request
        parameters.each_with_index do |(k,v), i|
          params_str += "?" if i == 0
          params_str += "#{k}=#{v}"
          params_str += "&" unless i == parameters.size - 1
        end

        cossack = Cossack::Client.new do |client|
          # follow up to 10 redirections (by default 5)
          client.use Cossack::RedirectionMiddleware
        end

        # get our "JSON" - 
        # this isn't actually pure JSON, as Tumblr wraps it in a JavaScript variable for some odd reason.
        response_js =  cossack.get("http://#{blog}.tumblr.com/api/read/json#{params_str}").body

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