class SessionsController < Devise::SessionsController

	before_action :go_offline, only: :destroy

	def go_offline
		user_id = current_user.id
		ActionCable.server.broadcast(
          "appearances_channel",
           user_id: user_id,
           online: false
        )
		$redis.del("#{user_id}:status")
	end

end