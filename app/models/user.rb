class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  after_initialize :init_posts

  # validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_count
    update(PostsCounter: posts.count)
  end

  private

  def init_posts
    self.PostsCounter ||= 0
  end
end
