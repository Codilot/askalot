class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:landing_page]

  def index
    session[:conversations] ||= []
      @users = User.all.where.not(id: current_user)
    if current_user.expertise == "Expert"
      @users_for_panel = @users
    else
      @users_for_panel = @users.where(expertise: "Expert")
    end

    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  def landing_page
  	if user_signed_in?
  	  @user = current_user
  	end

  end

end
