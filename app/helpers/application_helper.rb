module ApplicationHelper

  def date(date)
    return "#{date.day}|#{date.month}|#{date.year}"
  end

  def time(time)
    output = "#{time.hour}:"
    output += "0" if time.min < 10
    output += "#{time.min}"
    return output
  end

  def author_of(content)
    return content.user ? content.user.username : 'n/a'
  end
end
