require "json"
require "./base_post"

module Tumblr
  class ChatPost < BasePost
      post_json_mapping(
        title: {type: String},
        body: {type: String},
        dialogue: {type: Array(Chat)}
      )
  end

  class Chat
    JSON.mapping({
        name: {type: String},
        label: {type: String},
        phrase: {type: String}
      })
  end
end