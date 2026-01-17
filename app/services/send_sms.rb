class SendSms
  def self.call(to:, body:)
    TwilioClient.client.messages.create(
      from: Rails.application.credentials.dig(:twilio, :whatsapp_from),
      to: to,
      body: body
    )
  end
end
