require 'spec_helper'

describe UsersController do

  describe "GET 'signup'" do
    it "should be successful" do
      get 'signup'
      response.should be_success
    end
  end

  describe "GET 'info'" do
    it "should be successful" do
      get 'info'
      response.should be_success
    end
  end

  describe "GET 'jobs'" do
    it "should be successful" do
      get 'jobs'
      response.should be_success
    end
  end

end
