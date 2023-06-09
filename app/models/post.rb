class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    post_counter = author.posts.count
    author.update(posts_counter: post_counter)
  end
end
