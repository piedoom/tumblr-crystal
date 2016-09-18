require "json"
require "./base_post"

module Tumblr
  class QuotePost < BasePost
      post_json_mapping(
        text: {type: String},
        source: {type: String}
      )
  end
end