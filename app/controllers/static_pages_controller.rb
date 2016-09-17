class StaticPagesController < ApplicationController
  def home
<<<<<<<<< saved version
     @micropost = current_user.microposts.build if logged_in?
  end
=========
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  ends
>>>>>>>>> local version
end
