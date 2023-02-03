class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter
  after_destroy :decrement_post_counter

  def update_post_counter
    author.increment!(:post_counter)
  end

  def recents_five_comments
    comments.last(5)
  end

  def decrement_post_counter
    author.decrement!(:post_counter)
  end
end
