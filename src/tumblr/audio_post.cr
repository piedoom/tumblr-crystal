require "json"
require "./base_post"

module Tumblr
  class AudioPost < BasePost
      post_json_mapping(
        caption: {type: String, nilable: true},
        embed: {type: String, key: "player", nilable: true},
        plays: {type: Int32, nilable: true},
        album_art: {type: String, nilable: true},
        artist: {type: String, nilable: true},
        album: {type: String, nilable: true},
        name: {type: String, nilable: true, key: "track_name"},
        track: {type: Int32, nilable: true, key: "track_number"},
        year: {type: Int32, nilable: true}
      )
  end
end