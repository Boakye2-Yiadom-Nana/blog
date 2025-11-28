class Post < ApplicationRecord
     has_many :comments, dependent: :destroy
     validates :title, presence: true
     validates :content, presence: true
     has_one_attached :image
end
