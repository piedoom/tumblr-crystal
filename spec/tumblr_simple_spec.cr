require "./spec_helper"

describe Tumblr::Simple do

  it "should get blog and posts data" do
    Tumblr::Simple::Client.get_all("staff").should be_a(Tumblr::Simple::Blog)
  end

  it "should return an error when using an invalid blog" do
    expect_raises(Exception) do 
      Tumblr::Simple::Client.get_all("staff.tumblr.com")
    end
  end

  it "should get the blog name 'staff' for the staff Tumblr" do
    Tumblr::Simple::Client.get_all("staff").blog.should eq "staff"
  end
  
  it "should get at least one post in the 'staff' blog" do
    (Tumblr::Simple::Client.get_all("staff").posts.size >= 1).should eq true
  end

  it "should retrieve exactly two posts" do 
    Tumblr::Simple::Client.get_all(blog: "staff", amount: 2).posts.size.should eq 2
  end

  it "should retrieve 50 posts when requesting more than 50" do
    Tumblr::Simple::Client.get_all(blog: "staff", amount: 100).posts.size.should eq 50
  end

  it "should get a post with a specific ID" do
    Tumblr::Simple::Client.get_post(blog: "staff", id: 150372753074).id.should eq "150372753074"
  end

  it "should get only posts from a blog" do
    Tumblr::Simple::Client.get_posts("staff").should be_a(Array(Tumblr::Simple::BasePost))
  end

end
