class User < ApplicationRecord
  # options under app/models/concerns/online.rb
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  def name
    email.split('@')[0]
  end


  def online?
    !$redis.get("user_#{self.id}_online").nil?
  end

end
