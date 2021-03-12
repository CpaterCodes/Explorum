class Post < ApplicationRecord

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { maximum: 300 }
  validates :content, length: { maximum: 50 }, if: -> { user_id.nil? }

end
