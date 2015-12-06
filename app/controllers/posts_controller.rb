class PostsController < ApplicationController

  before_action :find_post, only: [:show]

  def index
    @posts = Post.includes(:user, :votes).order(id: :desc)
    .paginate(:page => params[:page], :per_page => 20)

    if request.xhr?
      render partial: 'posts'
    else
      render :index
    end
  end

  def show
    @comments = @post.comments.includes(:user, :votes).order(id: :desc)
    .paginate(:page => params[:page], :per_page => 20)
  end


  private
    def find_post
      @post = Post.includes(:comments, :votes).find_by(slug: params[:id])
    end

    def post_params
      params.permit(:page)
    end
end
