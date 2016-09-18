require "json"
require "./post_type"
require "./base_post"

module Tumblr
  class Photo
    JSON.mapping({
      original: {type: AltPhoto, key: "original_size", nilable: true},
      caption: {type: String, nilable: true},
      sizes: {type: AltPhoto, key: "alt_sizes", nilable: true}
    })
  end

  class AltPhoto
    JSON.mapping({
      width: {type: Int32},
      height: {type: Int32},
      url: {type: String}
    })
  end
end