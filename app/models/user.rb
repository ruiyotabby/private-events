class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true
  has_many :events, class_name: "Event", foreign_key: "creator_id", dependent: :destroy
  has_many :tickets, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, through: :tickets, source: :attended_event, dependent: :destroy
end
