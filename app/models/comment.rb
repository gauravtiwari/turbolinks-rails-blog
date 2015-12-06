class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post, counter_cache: true
  has_many :votes, as: :votable

  # Common Concern
  include Votable

  # Basic validation
  validates_presence_of :body, :user_id, :post_id

end
