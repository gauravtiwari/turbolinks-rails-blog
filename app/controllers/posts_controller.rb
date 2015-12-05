class PostsController < ApplicationController

  before_filter :find_post, only: [:show]

  def index
    @posts = Post.order(id: :desc).limit(10)
    .paginate(:page => params[:page], :per_page => 20)
  end

  def show
  end


  private
    def find_post
      @post = Posts.find(params[:id])
    end

    def post_params
      params.permit(:page)
    end
end
