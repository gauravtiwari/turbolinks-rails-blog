class CommentsController < ApplicationController

  before_action :authenticate_user, only: [:create, :destroy, :update]
  before_action :find_post
  before_action :find_comments, except: [:edit, :update]
  before_action :find_comment, only: [:edit, :update, :destroy]

  # GET /posts/:id/comments
  def index
    # Render comments
    respond_to do |format|
      format.html do
        render partial: 'comments', locals: { comments: @comments }
      end
      format.json
    end
  end

  # POST /posts/:id/comments
  def create
    # Build a comment
    @comment = Comment.new(
      comment_params
    )

    @comment.user = current_user
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        # Render comment
        format.html do
          render partial: 'comments', locals: {comments: @comments}
        end

        format.json { render :show }
        # => Turbolinks appends the nodes in `comments_list`
      else
        # Render error
        format.html do
          render partial: 'comments',
          locals: {comments: @comments},
          status: unprocessable_entity
        end
        format.json {
          render json: @comment.errors,
          status: unprocessable_entity
        }
      end
    end
  end

  # GET /posts/:id/comments/:id/edit
  def edit
    # Render comment
    render partial: 'form', locals: { comment: @comment, resource: @post }
  end

  # PUT /posts/:id/comments/:id
  def update
    # Update a comment
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        # Render comment
        format.html do
          render partial: 'comment',
          locals: { comment: @comment, resource: @post }
        end
        format.json { render :show }
      else
        # Render error
        format.html do
          render partial: 'comment',
          locals: { comment: @comment, resource: @post },
          status: unprocessable_entity
        end
        format.json {
          render json: @comment.errors,
          status: unprocessable_entity
        }
      end
    end
  end

  # DELETE /posts/:id/comments/:id
  def destroy
    # Build a comment
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        # Destroy comment
        format.html do
          render partial: 'comments', locals: { comments: @comments }
        end
        format.json { render :show }
      else
        # Render error
        format.html do
         render partial: 'comments',
         locals: { comments: @comments },
         status: unprocessable_entity
        end
        format.json {
         render json: @comment.errors,
         status: unprocessable_entity
        }
      end
    end
  end

  private
    def find_comment
      @comment = Comment.find(params[:id])
      authorize @comment
    end

    def find_post
      @post = Post.includes(:comments).find_by(slug: params[:post_id])
    end

    def find_comments
      @comments = @post.comments.order(id: :desc)
      .paginate(:page => params[:page], :per_page => 20)
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
