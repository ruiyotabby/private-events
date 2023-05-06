class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  has_many :attendees, through: :tickets
end
