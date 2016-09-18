require "./spec_helper"

describe Tumblr do
  c = Tumblr::Client.new(ENV["CK"], ENV["CS"], ENV["OT"], ENV["OS"])

  it "gets a user" do
    c.user_info.should be_a(Tumblr::User)
  end

  it "gets at least one blog from our user" do
    c.user_info.blogs.first.should be_a(Tumblr::Blog)
  end

  it "gets some posts from our dashboard" do
    c.dashboard.should be_a(Array(Tumblr::BasePost))
  end

end
