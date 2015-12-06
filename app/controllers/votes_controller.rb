class VotesController < ApplicationController

  before_action :authenticate_user, only: [:create, :destroy, :update]
  before_action :find_votable
  before_action :find_vote, only: [:destroy]

  # POST /posts/:id/comments
  def create
    # Build a comment
    @vote = Vote.new(
      user: current_user,
      votable: @votable
    )

    respond_to do |format|
      if @vote.save
        # Render comment
        format.html do
          render partial: 'votes', locals: {votes: @votes}
        end

        format.json { render :show }
        # => Turbolinks appends the nodes in `comments_list`
      else
        # Render error
        format.html do
          render partial: 'votes',
          locals: {votes: @votes},
          status: unprocessable_entity
        end
        format.json {
          render json: @vote.errors,
          status: unprocessable_entity
        }
      end
    end
  end

  # DELETE /posts/:id/comments/:id
  def destroy
    # Build a comment
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.destroy
        # Destroy comment
        format.html do
          render partial: 'votes', locals: { votes: @votes }
        end
        format.json { render :show }
      else
        # Render error
        format.html do
         render partial: 'votes',
         locals: { votes: @votes },
         status: unprocessable_entity
        end
        format.json {
         render json: @vote.errors,
         status: unprocessable_entity
        }
      end
    end
  end

  private
    def find_votable
      @vote = Vote.find(params[:id])
      authorize @vote
    end

    def find_comment
      @votable = params[:votable_type].constantize.find(params[:votable_id])
    end

end
