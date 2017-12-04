class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, presence: true
  validates :name, uniqueness: true

  
  def mood
    happiness > nausea ? "happy" : "sad"
  end
end
