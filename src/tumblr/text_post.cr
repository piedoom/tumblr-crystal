require "json"
require "./base_post"

module Tumblr
  class TextPost < BasePost
    post_json_mapping(
      title: {type: String, nilable: true},
      body: {type: String, nilable: true}
    )
  end
end