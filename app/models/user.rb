class User < ApplicationRecord
  attr_accessor :content
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_friendships, class_name: 'Friendship', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include ImageUploader::Attachment.new(:avatar)
  before_save { |user| user.user_name = user.user_name.downcase }
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  def like!(post)
    likes.create!(post_id: post.id)
  end

  def unlike!(post)
    like = likes.find_by(post_id: post.id)
    like.destroy!
  end

  def like?(post)
    likes.find_by(post_id: post.id)
  end

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end
