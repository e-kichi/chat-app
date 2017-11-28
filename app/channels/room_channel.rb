class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
  end

  def unsubscribed
  end

  def post_message(data)
    # TODO: ActiveJob化
    MessageSender.send(text: data['message'], received_at: Time.now)
  end
end
