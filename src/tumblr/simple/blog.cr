require "./base_post"

module Tumblr
  module Simple
    class Blog

      property title : String
      property description : String
      property blog : String
      property timezone : String
      property domain : String
      property total_posts : Int32
      property offset : Int32
      property posts : Array(BasePost)

      def initialize(json)
        @title        = json["tumblelog"]["title"].to_s
        @description  = json["tumblelog"]["description"].to_s
        @blog         = json["tumblelog"]["name"].to_s
        @timezone     = json["tumblelog"]["timezone"].to_s
        @domain       = json["tumblelog"]["cname"].to_s
        @total_posts  = json["posts-total"].as_i
        @offset       = json["posts-start"].as_i
        @posts        = json["posts"].map do |post|
          BasePost.new(post)
        end
      end
    end
  end
end