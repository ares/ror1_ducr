class Computer < ApplicationRecord
  ALLOWED_CITIES = ['Olomouc', 'Praha', 'Brno', 'Ostrava']

  belongs_to :operating_system, :required => false

  validates :vendor, :presence => true
  validates :city, :inclusion => ALLOWED_CITIES
  validates :serial_number, :numericality => true, :uniqueness => true
end
