class Event < ApplicationRecord
  validates :start_date, presence:true
  validates :duration, presence:true
  validate  :valid_duration
  validates :title, length: { minimum: 5, maximum: 140 }, presence: true
  validates :price, numericality: true, presence: true
  validates :administrator, presence:true

  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :participants, through: :attendances, class_name: "User"

  private

  def valid_duration()
    unless duration.to_i > 0 && duration.to_i % 5 == 0 
      errors.add(:duration, "La durée de l'événement doit être un multiple de 5.")
    end
  end 
end
 