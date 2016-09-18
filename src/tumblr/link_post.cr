require "json"
require "./base_post"
require "./photo"

module Tumblr
  class LinkPost < BasePost
      post_json_mapping(
        title: {type: String},
        url: {type: String},
        author: {type: String},
        excerpt: {type: String},
        publisher: {type: String},
        photos: {type: Array(Photo)},
        description: {type: String}
      )
  end
end