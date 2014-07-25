class ArticlesController < ApplicationController
	before_filter :help
	def help
		@article = Article.find(params[:id])
    @current_page = request.env['PATH_INFO']
    @body_bg = ["default", "first", "second"]
    @vk_nav = [ pressa_path, classes_path, doings_path, news_path, contacts_path ]
  end
end
