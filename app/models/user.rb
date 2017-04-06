class User < ActiveRecord::Base
  has_many :picks
  has_many :mypicks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :is_understood, :presence => true

  # before_create :set_boolean

  # def set_boolean
  #   is_understood = 'true'
  #   save
  # end


end
