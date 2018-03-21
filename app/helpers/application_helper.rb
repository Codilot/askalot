module ApplicationHelper


  def gravatar_for(user, opts = {})
  	  opts[:alt] = user.name
      image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
                class: "user-#{user.id} gravatar online_status",
                data_user_id: "#{user.id}"
                                       
  end



  # def online_status(user)
  #   content_tag :span, "online",
  #               data_user_id: "#{user.id}",
  #               class: "user-#{user.id} online_status #{'online' if user.online?}"
  # end
  
end
