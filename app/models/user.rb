class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def last_three_post
    posts.where(author_id: self).order('created_at DESC').limit(3)
  end
end
