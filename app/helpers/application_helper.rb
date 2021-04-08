module ApplicationHelper
  
  def login_helper(style = '')
    if logged_in?
      (link_to 'Logout', logout_path, method: :delete, class: style) + ' '.html_safe +
      (link_to "#{current_user.name}'s events ", current_user, class: style) + ' '.html_safe +
      (link_to 'New event', new_event_path, class: style)
    else
      (link_to 'Sign Up', new_user_path, class: style) + ' '.html_safe +
        (link_to 'Login', login_path, class: style)
    end
  end

  def link_to_attend(event)
    if logged_in?
      link_to 'Attend Event!', attend_event_path(event)
    else
        (link_to 'Login', login_path) + ' or '.html_safe + (link_to 'Sign Up', new_user_path) + ' to attend!'.html_safe 
    end
  end
end
