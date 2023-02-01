class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_post
    posts.where(author_id: self).order('created_at DESC').limit(3)
  end
end
