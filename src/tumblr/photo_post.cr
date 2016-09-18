require "json"
require "./base_post"

module Tumblr
  class PhotoPost < BasePost
    post_json_mapping(
      photos: {type: Photo},
      caption: {type: String, nilable: true},
      width: {type: Int32, nilable: true},
      height: {type: Int32, nilable: true}
    )
  end
end