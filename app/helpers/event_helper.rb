module EventHelper
  def print_events(events)
    html = ""
    events.each do |event|
      html << "<li>#{event.title}</li>"
    end
    html.html_safe
  end


end
