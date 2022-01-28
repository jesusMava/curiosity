# frozen_string_literal: true

class StatementController < ApplicationController
  before_action :authenticate_user!

  def create
    # Should only exist a record by user and curiosity
    @statement = Statement.find_or_initialize_by(
      user_id: current_user.id,
      curiosity_card_id: params[:curiosity_card_id]
    )

    @statement.update!(is_real: params[:is_real])

    redirect_to root_path
  end
end
