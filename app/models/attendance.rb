class Attendance < ApplicationRecord
  validates :stripe_customer_id, :participant, :event, presence: true
  
  belongs_to :participant, class_name: "User"
  belongs_to :event
end
