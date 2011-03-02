require 'spec_helper'

describe Nanopost do
 
  before(:each) do
     @user = Factory(:user)
     @attr = { :content => "value for content" }
   end

   it "should create a new instance given valid attributes" do
     @user.nanoposts.create!(@attr)
   end

   describe "user associations" do

     before(:each) do
       @nanopost = @user.nanoposts.create(@attr)
     end

     it "should have a user attribute" do
       @nanopost.should respond_to(:user)
     end

     it "should have the right associated user" do
       @nanopost.user_id.should == @user.id
       @nanopost.user.should == @user
     end
   end
 
   describe "validations" do

      it "should require a user id" do
        Nanopost.new(@attr).should_not be_valid
      end

      it "should require nonblank content" do
        @user.nanoposts.build(:content => "  ").should_not be_valid
      end

      it "should reject long content" do
        @user.nanoposts.build(:content => "a" * 141).should_not be_valid
      end
    end
 
end
