class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  has_many :tickets, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :tickets, source: :attendee, dependent: :destroy

  def self.past
    where('date < ?', Date.today)
  end

  def self.future
    where('date > ?', Date.today)
  end

end
