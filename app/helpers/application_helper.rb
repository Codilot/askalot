module ApplicationHelper


  def gravatar_for(user, opts = {})
  	  opts[:alt] = user.name
      image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
                class: "user-#{user.id} gravatar #{'online' if user.online}",
                data_user_id: "#{user.id}"
                                       
  end

  
end
