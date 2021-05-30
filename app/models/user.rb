class User < ApplicationRecord
  before_validation { email.downcase! }
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  #フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  enum admin: { 一般: false, 管理者: true }
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true, length: { maximum: 10}
  validates :email, presence: true, length: { maximum: 30},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_destroy :lost_admin
  private
  def lost_admin
    if User.where(admin: true).count == 1 && self.admin == "管理者"
      throw(:abort)
    end
  end 

end
