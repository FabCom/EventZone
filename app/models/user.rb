class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :administer_events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendance_at_events, foreign_key: 'participant_id', class_name: "Attendance"
  has_one_attached :avatar

  after_create :welcome_send


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
