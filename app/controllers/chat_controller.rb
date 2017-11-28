class ChatController < ApplicationController
  def index
    @messages = Message.latest_messages
  end
end
