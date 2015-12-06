class Post < ActiveRecord::Base

  acts_as_url :title, url_attribute: :slug
  belongs_to :user
  has_many :comments

  # Basic validation
  validates_presence_of :body, :user_id, :slug

  def to_param
    slug # or whatever you set :url_attribute to
  end

end
