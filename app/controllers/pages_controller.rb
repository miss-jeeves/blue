class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  def mission
    @title = "Mission"
  end

  def vision
    @title = "Vision"
  end

  def goals
    @title = "Values"
  end
end
