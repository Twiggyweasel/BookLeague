module Users
  class MeetingsController < ApplicationController
    before_action :set_user
    include Meetable

    def index
      @meetings = @user.meetings
    end

    private

    def set_user
      # TODO: udpate to user #current_user
      @user = User.first
    end
  end
end
