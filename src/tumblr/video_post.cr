require "json"
require "./base_post"

module Tumblr
  class VideoPost < BasePost
      post_json_mapping(
        caption: {type: String},
        embeds: {type: Embed, key: "player"}
      )
  end

  class Embed
    JSON.mapping({
      width: {type: Int32},
      embed: {type: String, key: "embed_code"}
    })
  end
end