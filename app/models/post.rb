class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  attr_accessor :avatar
end
