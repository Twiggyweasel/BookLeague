module Clubs
  class MeetingsController < ApplicationController
    before_action :set_club
    include Recommendable

    def index
      @meetings = @club.meetings
    end

    def show; end

    def new
      @meeting = Meeting.new
    end

    def create; end

    def edit; end

    def udpate; end

    def destroy; end

    private

    def set_club
      @club = Club.find(params[:club_id])
    end

    def recommendation_params
      params.require(:meeting).permit(:date, :club_id)
    end
  end
end
