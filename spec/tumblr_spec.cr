require "./spec_helper"

describe Tumblr do
  c = Tumblr::Client.new(ENV["CK"], ENV["CS"], ENV["OT"], ENV["OS"])

  it "gets a user" do
    c.get_user_info.should be_a(Tumblr::User)
  end

  it "gets at least one blog from our user" do
    c.get_user_info.blogs.first.should be_a(Tumblr::Blog)
  end

end
