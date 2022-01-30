# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not be valid without name' do
    category = build(:category, name: ' ')

    assert_not category.valid?
  end
end
