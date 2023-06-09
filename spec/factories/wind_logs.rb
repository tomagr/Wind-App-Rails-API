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

FactoryBot.define do
	factory :wind_log do
		station
		sequence(:speed) { rand(0.0..40.0) }
		sequence(:gust) { rand(0.0..40.0) }
		sequence(:direction) { rand(0.0..360.0) }
		sequence(:registered_date) { Time.zone.now }
	end
end
