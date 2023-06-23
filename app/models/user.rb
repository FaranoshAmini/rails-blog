class User < ApplicationRecord
  # Include default devise modules. Others available are:
<<<<<<< HEAD
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
=======
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
>>>>>>> 52ecccd08fd92f2e5451b569da1e82de2653adf5
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  def recent_posts
    Post.where(author: self).order(updated_at: :desc).limit(3)
  end
end
