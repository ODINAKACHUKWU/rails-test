class Admin::MessagesController < ApplicationController
  before_action :set_message, only: [:update]

  def index
    @messages = Message.order('created_at DESC')
  end

  def update
    @message.hidden = !@message.hidden

    if @message.save
      redirect_to admin_messages_path
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
