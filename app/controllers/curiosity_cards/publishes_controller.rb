# frozen_string_literal: true

module CuriosityCards
  class PublishesController < ApplicationController
    before_action :set_curiosity

    def update
      @curiosity.publish!
      redirect_to @curiosity
    end

    def destroy
      @curiosity.unpublish!
      redirect_to @curiosity, status: :see_other
    end

    private

    def set_curiosity
      @curiosity = authorize(CuriosityCard.find(params[:curiosity_card_id]))
    end
  end
end
