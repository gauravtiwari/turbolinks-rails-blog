class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  # Basic validation
  validates_presence_of :body, :user_id, :post_id

end
