require "json"

module Tumblr
  # defines a Tumblr user
  class Blog
    JSON.mapping({
      name: {type: String},
      likes: {type: Int32},
      following: {type: Int32},
      default_post_format: {type: String}
    })

    def initialize(params)

      # parse our JSON
      json = JSON.parse(params)

      # find the appropriate object
      j = json["response"]["user"]
      #puts j
        # assign all properties to our json
      @name =               j["name"].as_s
      @likes =              j["likes"].as_i
      @following =          j["following"].as_i
      @default_post_format = j["default_post_format"].as_s
    end
  end
end
