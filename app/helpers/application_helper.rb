module ApplicationHelper
  def show_user_name
    html = ""
    if current_user
     html << "<li> #{current_user.name} </li> "
    end 
    html.html_safe
  end

  def show_user_events
    html = ""
    if current_user
     html << "<li> #{link_to 'Your Events', user_path(current_user)} </li>"
    end 
    html.html_safe
  end

  def show_sign_in_and_sign_up
    html = ""
    if !current_user
     html << "<li> #{link_to 'Sign In', login_path, method: :get} </li> "
     html << "<li> #{link_to 'Sign Up', signup_path, method: :get} </li> "
    end 
    html.html_safe
  end

  def show_sign_out
    html = ""
    if current_user
     html << "<li> #{link_to 'Sign Out', logout_path, method: :delete} </li> "
    end 
    html.html_safe
  end
end
