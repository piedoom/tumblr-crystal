require "./spec_helper"

describe Tumblr do
  # TODO: Write tests

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

  

end
