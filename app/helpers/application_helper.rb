module ApplicationHelper
  def show_user_name
    html = ''
    html << "<li> #{current_user.name} </li> " if current_user
    html.html_safe
  end

  def show_user_events
    html = ''
    html << "<li> #{link_to 'Your Events', user_path(current_user)} </li>" if current_user
    html.html_safe
  end

  def show_sign_in_and_sign_up
    html = ''
    unless current_user
      html << "<li> #{link_to 'Sign In', login_path, method: :get} </li> "
      html << "<li> #{link_to 'Sign Up', signup_path, method: :get} </li> "
    end
    html.html_safe
  end

  def show_sign_out
    html = ''
    html << "<li> #{link_to 'Sign Out', logout_path, method: :delete} </li> " if current_user
    html.html_safe
  end
end
