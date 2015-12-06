class PostsController < ApplicationController

  before_action :find_post, only: [:show]

  def index
    @posts = Post.includes(:user).order(id: :desc)
    .paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @comments = @post.comments.order(id: :desc)
    .paginate(:page => params[:page], :per_page => 20)
  end


  private
    def find_post
      @post = Post.includes(:comments).find_by(slug: params[:id])
    end

    def post_params
      params.permit(:page)
    end
end
