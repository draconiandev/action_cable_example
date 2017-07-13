# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chatroom, only: %i[show destroy]

  def index
    @chatrooms = Chatroom.all.order(topic: :asc)
  end

  def show
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    chatroom = Chatroom.new(chatroom_params)
    if chatroom.save
      respond_to do |format|
        format.html { redirect_to chatroom, notice: 'Chatroom created' }
        format.json { head :ok, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, alert: 'Something went wrong' }
        format.json { render json: chatroom.errors, status: :unprocessible_entity }
      end
    end
  end

  private

  def find_chatroom
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
