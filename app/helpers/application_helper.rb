module ApplicationHelper
  def per_capital_rate(str)
    new_str = ''
    str.chars.each do |char|
      new_str << "<span>#{char}</span>"
    end
    new_str.html_safe
  end
end
