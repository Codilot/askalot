class AppearancesChannel < ApplicationCable::Channel
  
  def subscribed
    $redis.set("#{current_user.id}:status", "online")
    stream_from("appearances_channel")
    ActionCable.server.broadcast 'appearances_channel',
                                 user_id: current_user.id,
                                 online: true
  end

  def unsubscribed
    $redis.del("#{current_user.id}:status")
    ActionCable.server.broadcast 'appearances_channel',
                                 user_id: current_user.id,
                                 online: false
    stop_all_streams
  end

end
