class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  after_save :post_counter_update
  def update_comments_counter
    update_attribute(:comments_counter, comments.count)
  end

  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).limit(5)
  end
  private
  def post_counter_update
    author.increment!(:posts_counter)
  end
end
