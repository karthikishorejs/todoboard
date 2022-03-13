class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  validates_presence_of :name_full
  validates_length_of :name_full, :minimum => 5, :maximum => 100 
  
  # dependent: :destroy means the posts related 
  # to the specific user in mention get deleted if the user does.
  has_many :posts, dependent: :destroy 

  has_many :comments, through: :posts
end
