module HomeHelper
  def render_rss item
    "<li>" + link_to(h(item.title), item.link, :title => truncate(h(item.description), 50)).to_s + "</li>"
  end
end
