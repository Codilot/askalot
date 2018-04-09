class User < ApplicationRecord
  # options under app/models/concerns/online.rb
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, :dependent => :destroy
  has_many :conversations, foreign_key: :sender_id, :dependent => :destroy

  validates :expertise, inclusion: { in: %w(Expert Senior Junior Newbie),
    message: "%{value} is not valid" }, allow_nil: true

  def name
    email.split('@')[0]
  end


  def online 
    $redis.get("#{self.id}:status") == "online" 
  end



end
