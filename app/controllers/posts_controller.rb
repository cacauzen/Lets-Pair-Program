class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

	def index
    @categories = Category.all
	end

  def new
    @section = Section.find_by_id(params[:section_id])

    if @section.nil?
      redirect_to posts_path
    else
      @post = Post.new
    end
  end

  def create
    @section = Section.find_by_id(params[:section_id])

    unless @section.nil?
      @post = @section.posts.create(post_params.merge(user: current_user))
    end      
      redirect_to posts_path
  end

  def show
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :message)
  end

end
