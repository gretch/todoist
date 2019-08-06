require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should validate_presence_of(:description).with_message('is required') }
  it { should validate_length_of(:description).is_at_most(250) }
  it { is_expected.to allow_value("2019-08-06").for(:completed_at) }
end
