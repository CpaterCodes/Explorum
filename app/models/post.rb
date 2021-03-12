class Post < ApplicationRecord

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { maximum: 300 }
  validates :content, length: { maximum: 50 }, if: -> { user_id.nil? }

  def format_date(date)
    return "#{date.day}|#{date.month}|#{date.year}"
  end

  def format_time(time)
    output = "#{time.hour}:"
    output += "0" if time.min < 10
    output += "#{time.min}"
    return output
  end

end
