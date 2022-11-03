class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :author, class_name: 'User'

    def five_recent_comments
        comments.order(created_at: :desc).limit(5)
    end

    private
    def update_comments_count
        update(CommentsCounter: comments.count)
    end

    def update_likes_count
        update(LikesCounter: likes.count)
    end
end
