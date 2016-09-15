require "./tumblr/*"
require "./tumblr/simple/*"

module Tumblr
  c = Tumblr::Client.new(ENV["CK"], ENV["CS"], ENV["OT"], ENV["OS"])
  puts c.get_user_info
end

