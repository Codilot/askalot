class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:landing_page]

  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  def landing_page
  end

end
