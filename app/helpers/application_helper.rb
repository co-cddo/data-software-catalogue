module ApplicationHelper
  def authentication_control
    return if controller_name == 'sessions'
    return logout_button if user_signed_in?

    login_button
  end

  def logout_button
    button_to(
      "Log out",
      destroy_user_session_path,
      method: :delete,
      class: 'gem-c-button govuk-button gem-c-button--secondary-quiet'
    )
  end

  def login_button
    button_to(
      "Log in",
      new_user_session_path,
      method: :get,
      class: 'gem-c-button govuk-button gem-c-button--secondary-quiet'
    )
  end
end
