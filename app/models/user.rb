class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  def self.get_posts(user_id)
    @user  = User.find(user_id)
    @posts = @user.posts.order(created_at: :desc)
  end

end
