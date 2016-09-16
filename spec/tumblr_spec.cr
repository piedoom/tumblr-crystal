require "./spec_helper"

describe Tumblr do
  c = Tumblr::Client.new(ENV["CK"], ENV["CS"], ENV["OT"], ENV["OS"])

  it "gets a user blog" do
    c.get_user_info.should be_a(Tumblr::User)
  end
end
