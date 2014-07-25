class PagesController < ApplicationController
  before_filter :help

  def help
    @current_page = request.env['PATH_INFO']
    @body_bg = ["default", "first", "second"]
    @vk_nav = [ pressa_path, classes_path, doings_path, contacts_path ]
  end

  def index
  end

  def about
  end

  def news
  end

  def pressa
  end
  
  def classes
  end

  def doings
  end

  def contacts
  end

  def new
  end

  def ugolki
  end

  def sozvezdie
  end
  
  def lady
  end

  def homo
  end

  def show
    
  end

end
