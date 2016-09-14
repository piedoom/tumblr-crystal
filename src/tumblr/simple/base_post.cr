module Tumblr
  module Simple
    class BasePost

      property id : String
      property url : String
      property url_slug : String
      property post_type : String

      def initialize(json)
        @id = json["id"].to_s
        @url = json["url"].as_s
        @url_slug = json["url-with-slug"].as_s
        @post_type = json["type"].as_s
      end

      # factory method to create any of the several tumblr post types
      def self.create(json, post_type)
        
      end

    end
  end
end