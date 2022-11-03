class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :posted_comments_count

  def posted_comments_count
    post.update_comments_count
  end
end
