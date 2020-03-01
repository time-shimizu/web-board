module ApplicationHelper
  def full_title(page_title)
    base_title = "11ちゃんねる"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
