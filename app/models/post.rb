class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  after_save :update_post_counter

  validates :Title, presence: true
  validates :Title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end

  private

  def update_comments_count
    update(CommentsCounter: comments.count)
  end

  def update_likes_count
    update(LikesCounter: likes.count)
  end
end
