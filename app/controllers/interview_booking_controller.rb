class InterviewBookingController < ApplicationController
  before_action :authenticate_user!

  def book_interview_slot
    byebug
  end
end
