# frozen_string_literal: true

module CuriosityCardHelper
  def real_option_selected(curiosity, user)
    return if curiosity.selected_by?(user).nil?

    return 'has-background-primary' if curiosity.selected_by?(user)
  end

  def fake_option_selected(curiosity, user)
    return if curiosity.selected_by?(user).nil?

    return 'has-background-danger' unless curiosity.selected_by?(user)
  end
end
