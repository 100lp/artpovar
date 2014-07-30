class CategoriesController < ApplicationController
	before_filter :help

  def help
    @current_page = request.env['PATH_INFO']
    @body_bg = ["default", "first", "second"]
		@gallery_nav = [ new_path, ugolki_dushi_path, sozvezdii_slona_path, lady_path, homo_insectarium_path, about_path ]
  end
	def show
		render(params[:category_name])
	end
end
