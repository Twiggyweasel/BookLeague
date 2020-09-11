module Users
  class RecommendationsController < ApplicationController
    before_action :set_user
    include Recommendable

    def index
      @recommendations = @user.recommendations
    end

    def create
      @recommendation = Recommendation.create(recommendation_params)

      respond_to do |format|
        if @recommendation.save
          format.html { redirect_to @recommendation, notice: "Recommendation was successfully created." }
          format.json { render :show, status: :created, location: @recommendation }
        else
          format.html { render :new }
          format.json { render json: @recommendation.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @recommendation.update(recommendation_params)
          format.html { redirect_to @recommendation, notice: "recommendation was successfully updated." }
          format.json { render :show, status: :ok, location: @recommendation }
        else
          format.html { render :edit }
          format.json { render json: @recommendation.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @recommendation.destroy

      respond_to do |format|
        format.html { redirect_to [@user, :recommendations], notice: "Recommendation was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
