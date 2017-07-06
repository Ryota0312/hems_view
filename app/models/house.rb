class House < ApplicationRecord
  has_many :mains
  has_many :solar_generates
  has_many :solar_sells
  has_many :battery_charges
  has_many :battery_discharges
  has_many :fuel_cells
  has_many :gus
  has_many :waters
end
