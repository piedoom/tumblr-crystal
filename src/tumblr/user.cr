require "json"

module Tumblr
  # defines a Tumblr user
  class User
    JSON.mapping({
      name: {type: String},
      likes: {type: Int32},
      following: {type: Int32},
      default_post_format: {type: String}
    })
  end
end
