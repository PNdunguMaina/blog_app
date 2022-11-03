class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :posted_likes_count

  def posted_likes_count
    post.update_likes_count
  end
end
