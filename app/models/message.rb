class Message < ApplicationRecord
  def self.latest_messages(count: 100)
    Message.order(received_at: :asc).limit(count)
  end
  
  def render_message
    "#{received_at}: #{text}"
  end
end
