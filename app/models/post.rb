class Post < ApplicationRecord

  belongs_to :user, optional: true
  validates :content, presence: true

  def format_date(date)
    return "#{date.day}|#{date.month}|#{date.year}"
  end

  def format_time(time)
    output = "#{time.hour}:"
    output += "0" if time.min < 10
    output += "#{time.min}"
    return output
  end

  def name_user(id)
    User.find(id).username
  end

end
