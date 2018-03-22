class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_user, only: [:update_expertise]

  
  def update_expertise
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to pages_index_path, notice: 'Your experience was successfully updated.' }
      else
        format.html { redirect_to pages_landing_page_path, notice: 'Something went wrong please try again.' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:expertise)
    end
end
