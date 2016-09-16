module Tumblr
  module Response

    # Tumblr's API design has a few nested objects.  We can't extract
    # them the normal way, so this helper method exists.
    # [See this issue](https://github.com/crystal-lang/crystal/issues/3313)
    def self.from_json(string_or_io, klass, field)
      pull = JSON::PullParser.new(string_or_io)
      pull.on_key!("response") do
        pull.on_key!(field) do
          klass.new(pull)
        end
      end
    end
  end
end