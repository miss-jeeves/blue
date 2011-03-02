require 'spec_helper'

describe nanopostsController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  describe "POST 'create'" do

     before(:each) do
       @user = test_sign_in(Factory(:user))
     end

     describe "failure" do

       before(:each) do
         @attr = { :content => "" }
       end

       it "should not create a nanopost" do
         lambda do
           post :create, :nanopost => @attr
         end.should_not change(nanopost, :count)
       end

       it "should render the home page" do
         post :create, :nanopost => @attr
         response.should render_template('pages/home')
       end
     end

     describe "success" do

       before(:each) do
         @attr = { :content => "Lorem ipsum" }
       end

       it "should create a nanopost" do
         lambda do
           post :create, :nanopost => @attr
         end.should change(nanopost, :count).by(1)
       end

       it "should redirect to the home page" do
         post :create, :nanopost => @attr
         response.should redirect_to(root_path)
       end

       it "should have a flash message" do
         post :create, :nanopost => @attr
         flash[:success].should =~ /nanopost created/i
       end
     end
  end
end