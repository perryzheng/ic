class PagesController < ApplicationController
  def home
    # if (signed_in?)
    #   #redirect_to user_path(current_user)
    #   redirect_to root_path
    # else
    #   @title = "Home"
    # end
    @title = "Home"
    if signed_in?
          @micropost = Micropost.new
          @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end
