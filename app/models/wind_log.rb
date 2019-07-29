# == Schema Information
#
# Table name: wind_logs
#
#  id              :bigint(8)        not null, primary key
#  speed           :float            not null
#  gust            :float
#  direction       :float            not null
#  registered_date :datetime
#  station_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_wind_logs_on_station_id  (station_id)
#

class WindLog < ApplicationRecord
  include StationsHelper

  before_save :round_values

  belongs_to :station
  validates_presence_of :speed, :direction, :registered_date


  def round_values
    self.speed = self.speed.round(1) unless self.speed.nil?
    self.gust = self.gust.round(1) unless self.gust.nil?
    self.direction = self.direction.round(1) unless self.direction.nil?
  end

  def speed_modified
    station == norden ? speed + NORDEN_DEVIATION : speed
  end

  def gust_modified
    station == norden ? gust + NORDEN_DEVIATION : gust
	end

end
