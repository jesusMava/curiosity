# frozen_string_literal: true

class StatementsController < ApplicationController
  before_action :authenticate_user!

  def update
    curiosity_card = CuriosityCard.find(params[:curiosity_card_id])
    statement = Statement.upsert(
      user: current_user,
      curiosity_card: curiosity_card,
      is_real: params[:is_real]
    )

    redirect_back(fallback_location: root_path)
  end
end
