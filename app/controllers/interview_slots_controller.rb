class InterviewSlotsController < ApplicationController
  before_action :authenticate_user!

  def new
    @selected_date = params[:date]&.to_date || Date.today
    @time_slots = generate_time_slots
  end

  def create
    interview_datetime = DateTime.parse("#{params[:date]} #{params[:interview_at]}")
    
    current_user.slot_bookings.create!(
      interview_date: params[:date],       # optional if you store only datetime
      selected_slot: interview_datetime,
      status: 'pending'
    )

    redirect_to root_path, notice: "Interview slot booked successfully!"
  end

  private

  def generate_time_slots
    date = @selected_date
    start_time = date.to_time.change(hour: 10, min: 0)
    end_time   = date.to_time.change(hour: 17, min: 0)

    slots = []
    while start_time < end_time
      slots << start_time
      start_time += 30.minutes
    end
    slots
  end
end
