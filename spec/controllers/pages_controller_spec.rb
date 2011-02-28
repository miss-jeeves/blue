require 'spec_helper'

describe PagesController do

  describe "GET 'mission'" do
    it "should be successful" do
      get 'mission'
      response.should be_success
    end
  end

  describe "GET 'vision'" do
    it "should be successful" do
      get 'vision'
      response.should be_success
    end
  end

  describe "GET 'values'" do
    it "should be successful" do
      get 'values'
      response.should be_success
    end
  end

end
