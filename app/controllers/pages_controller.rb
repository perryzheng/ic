class PagesController < ApplicationController
  def home
    if (signed_in?)
      redirect_to user_path(current_user)
    else
      @title = "Home"
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
