require "json"

module Tumblr
  # defines a Tumblr blog
  class Blog
    JSON.mapping({
      title: {type: String},
      name: {type: String},
      total_posts: {type: Int32},
      url: {type: String},
      updated: {type: Int64}, # TODO: return date instead of string
      description: {type: String},
      is_nsfw: {type: Bool},
      ask: {type: Bool},
      ask_page_title: {type: String},
      ask_anon: {type: Bool},
      submission_page_title: {type: String, nilable: true},
      can_submit: {type: Bool, nilable: true},
      followed: {type: Bool},
      can_send_fan_mail: {type: Bool, nilable: true},
      is_blocked_from_primary: {type: Bool, nilable: true},
      share_likes: {type: Bool},
      twitter_enabled: {type: Bool, nilable: true},
      twitter_send: {type: Bool, nilable: true},
      followers: {type: Int32, nilable: true},
      primary: {type: Bool, nilable: true},
      admin: {type: Bool, nilable: true},
      messages: {type: Int32, nilable: true},
      queue: {type: Int32, nilable: true},
      drafts: {type: Int32, nilable: true}
    })
  end
end