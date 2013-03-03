class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to @message
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      flash[:notice] = "Message updated successfully"
      redirect_to @message
    else
      flash[:errror] = "Something went wrong"
      render :action => "edit"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end
end
