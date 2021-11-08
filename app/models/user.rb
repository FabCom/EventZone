class User < ApplicationRecord
  has_many :administer_events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendance_at_events, foreign_key: 'participant_id', class_name: "Attendance"

  after_create :welcome_send


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
