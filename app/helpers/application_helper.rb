# frozen_string_literal: true

module ApplicationHelper
  def error_tag_for(model, key)
    messages = model.errors.full_messages_for(key)
    return if messages.blank?

    tag.span(messages.join(','), class: 'has-text-danger')
  end
end
