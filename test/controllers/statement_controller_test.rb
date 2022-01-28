# frozen_string_literal: true

require 'test_helper'

class StatementControllerTest < ActionDispatch::IntegrationTest
  test 'should create and update a statement' do
    curiosity = create(:curiosity_card)
    sign_in create(:user)

    assert_difference('Statement.count', 1) do
      post curiosity_card_statement_index_path(curiosity, is_real: true)
    end
  end

  test 'should redirec to root_path' do
    curiosity = create(:curiosity_card)
    sign_in create(:user)

    post curiosity_card_statement_index_path(curiosity, is_real: true)

    assert_redirected_to root_path
  end
end
