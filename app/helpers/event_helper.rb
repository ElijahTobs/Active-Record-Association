module EventHelper
  def print_events(events)
    html = ""
    events.each do |event|
      html << "<p>#{event.title}</p>"
      html << button_to('Check Event', event_path(event), method: :get)
    end
    html.html_safe
  end

  
end
