class Event < ApplicationRecord
    belongs_to :host, class_name: "User"
    has_many :attendances, foreign_key: :attended_event_id
    has_many :attendees, through: :attendances, source: :attendee
    scope :past, -> { where("time < ?", Time.now) }
    scope :future, -> { where("time > ?", Time.now) }
end
