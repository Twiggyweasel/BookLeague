module Meetable
  extend ActiveSupport::Concern

  included do
    before_action :set_meeting, only: %i[show edit destroy update]
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
