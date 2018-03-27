class SessionsController < Devise::SessionsController

	def destroy
		super
		$redis.del("#{current_user.id}:status")
	end

end