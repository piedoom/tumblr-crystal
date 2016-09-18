require "json"
require "./post_type"

module Tumblr
  abstract class BasePost
    macro post_json_mapping(**properties)
      JSON.mapping(
        blog_name: {type: String},
        id: {type: Int64},
        post_url: {type: String},
        post_type: {type: Tumblr::PostType, key: "type"},
        timestamp: {type: Int64},
        # TODO: Date
        # TODO: Format
        reblog_key: {type: String},
        tags: {type: Array(String)},
        has_bookmarklet: {type: Bool, nilable: true, key: "bookmarklet"},
        created_with_mobile: {type: Bool, nilable: true, key: "mobile"},
        source_url: {type: String, nilable: true},
        source_title: {type: String, nilable: true},
        is_liked: {type: Bool, nilable: true},
        # TODO: State enum
        total_posts: {type: Int32},
        {{properties.stringify[1...-1].id}}        
      )
    end
  end
end