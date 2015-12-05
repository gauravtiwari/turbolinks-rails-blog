class CommentsController < ApplicationController

  before_action :find_comment, only: [:update, :destroy]
  before_action :find_post, except: [:update, :destroy]

  def index
    @comments = Post.order(id: :desc).limit(10)
    .paginate(:page => params[:page], :per_page => 20)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # Render comment
    else
      # Render error
    end
  end

  private
    def find_comment
      @comment = Comment.find(params[:id])
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:page, :post_id, :page, :body, :user_id)
    end
end
