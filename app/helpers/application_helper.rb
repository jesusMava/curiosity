# frozen_string_literal: true

module ApplicationHelper
  def user_is_login
    if current_user
      button_to 'Log out', destroy_user_session_path,
                method: :delete, class: 'button is-light',
                data: { turbo: 'false' }
    else
      link_to 'Iniciar sesión', new_user_session_path, class: 'button is-info is-outlined'
    end
  end
end
