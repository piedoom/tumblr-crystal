require "json"
require "./base_post"

module Tumblr
  class AnswerPost < BasePost
      post_json_mapping(
        asking_name: {type: String},
        asking_url: {type: String},
        question: {type: String},
        answer: {type: String, nilable: true},
      )
  end
end