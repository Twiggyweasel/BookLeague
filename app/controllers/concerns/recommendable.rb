module Recommendable
  extend ActiveSupport::Concern

  included do
    before_action :set_recommendation, only: [:show, :edit, :destroy, :update]
  end

  def new
    @recommendation = Recommendation.new
  end

  def show; end

  def edit; end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:book_id, :club_id)
  end
end