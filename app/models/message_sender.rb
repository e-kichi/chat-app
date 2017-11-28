class MessageSender
  def self.send(text: '', received_at: nil)
    message = Message.create(text: text, received_at: received_at)
    ActionCable.server.broadcast('chat', message: message.render_message)
  end
end
