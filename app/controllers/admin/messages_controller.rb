class Admin::MessagesController < ApplicationController
  before_action :set_message, only: [:update]

  def index
    @messages = Message.order('created_at DESC')
  end

  def update
    @message.hidden = !@message.hidden

    if @message.save
      respond_to do |format|
        format.js { render partial: 'hide', object: @message }
      end
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
