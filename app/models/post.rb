class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  after_save :update_post_counter
  after_initialize :init

  validates :Title, presence: true
  validates :Title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  def update_comments_count
    update(CommentsCounter: comments.count)
  end

  def update_likes_count
    update(LikesCounter: likes.count)
  end


  private

  def init
    self.CommentsCounter ||= 0
    self.LikesCounter ||= 0
  end

  def update_post_counter
    author.increment!(:PostsCounter)
  end 
end
