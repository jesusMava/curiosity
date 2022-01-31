# frozen_string_literal: true

class CuriosityCardAdminController < CuriosityCardsController
  before_action :authenticate_user!

  def index
    @curiosities = CuriosityCard.unpublished
  end

  def destroy
    @curiosity.destroy
    redirect_to curiosity_card_admin_index_path, status: :see_other
  end

  private

  def curiosity_cards_params
    params.require(:curiosity_card).permit(:title, :content, :extra_comment,
                                           :truthful, :category_id, images: []).
      merge(published_at: DateTime.current)
  end
end
