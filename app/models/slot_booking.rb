class SlotBooking < ApplicationRecord
  belongs_to :user

  after_commit :send_sms, on: :create

  private

  def send_sms
    SendSms.call(to: "whatsapp:+919340875004", body: "#{user.email} booked an interview slot on #{selected_slot.strftime('%d %b %Y at %H:%M')}.")
  end
end
