class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true, counter_cache: true
end
