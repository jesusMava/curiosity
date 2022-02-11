# frozen_string_literal: true

class StatementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_curiosity, only: %i[update destroy]

  def update
    # rubocop:disable Rails/SkipsModelValidations
    Statement.upsert(
      user: current_user,
      curiosity_card: @curiosity_card,
      is_real: params[:is_real]
    )

    # rubocop:enable Rails/SkipsModelValidations
    redirect_back(fallback_location: root_path)
  end

  def destroy
    statement = Statement.find_by(user: current_user, curiosity_card: @curiosity_card)
    if statement&.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path, notice: 'You need to select a reaction first.'
    end
  end

  private

  def set_curiosity
    @curiosity_card = CuriosityCard.find(params[:curiosity_card_id])
  end
end
