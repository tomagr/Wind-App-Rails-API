# == Schema Information
#
# Table name: stations
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string           not null
#

require 'rails_helper'

RSpec.describe Station, type: :model do

	it { should respond_to(:name) }
	it { should validate_presence_of(:name) }
	it { should allow_value(false).for(:name) }
	it { should validate_length_of(:name).is_at_most(255) }

end
