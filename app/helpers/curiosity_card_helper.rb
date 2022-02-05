# frozen_string_literal: true

module CuriosityCardHelper
  def real_option_selected(curiosity, user)
    return unless curiosity.statement_exists?(user)

    return 'has-background-primary' if curiosity.selected_by?(user)
  end

  def fake_option_selected(curiosity, user)
    return unless curiosity.statement_exists?(user)

    return 'has-background-danger' unless curiosity.selected_by?(user)
  end
end
