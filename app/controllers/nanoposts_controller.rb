class NanopostsController < ApplicationController
  before_filter :authenticate, :only =>[:create, :destroy]
  before_filter :authorized_user, :only => :destroy


  def create  
    @nanopost  = current_user.nanoposts.build(params[:nanopost])
   if @nanopost.save
  redirect_back_or current_user
  
  else
     render 'pages/home'
  end   
  end

  def destroy
    @nanopost.destroy
    redirect_back_or current_user
  end
  
  private
  def authorized_user
        @nanopost = Nanopost.find(params[:id])
        redirect_to root_path unless current_user?(@nanopost.user)
      end
end