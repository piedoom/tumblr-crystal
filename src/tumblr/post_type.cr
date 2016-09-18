module Tumblr
  enum PostType
    Text,
    Quote,
    Photo,
    Link,
    Chat,
    Video,
    Audio,
    Answer

    # convert a string into a PostType
    def self.convert(post : String)
      case post
      when "text"
        return PostType::Text
      when "quote"
        return PostType::Quote
      when "photo"
        return PostType::Photo
      when "link"
        return PostType::Link
      when "chat"
        return PostType::Chat
      when "video"
        return PostType::Video
      when "audio"
        return PostType::Audio
      when "answer"
        return PostType::Answer
      else
        return PostType::Text
      end
    end

    def self.to_string(post : PostType)
      return post.to_s.downcase
    end

  end
end