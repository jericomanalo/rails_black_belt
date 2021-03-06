class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, :dependent => :destroy 
  # has_many :users, through: :likes

  validates :message, presence: true

  def user
  	User.find(self.user_id)
  end

end
