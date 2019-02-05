# == Schema Information
#
# Table name: periods
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  start_year  :integer
#  start_month :integer
#  start_day   :integer
#  end_year    :integer
#  end_month   :integer
#  end_day     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


RSpec.describe Period, type: :model do
  it "a period has many observations" do
    period = create(:period)
    observation_01 = create(:observation)
    observation_02 = create(:observation)
    period.observations << observation_01
    period.observations << observation_02
    expect(period.observations.count).to eq 2
  end

  it "a observation has many periods" do
    observation = create(:observation)
    period_01 = create(:period)
    period_02 = create(:period)
    observation.periods << period_01
    observation.periods << period_02
    expect(observation.periods.count).to eq 2
  end

  it "period can not have duplicate observation" do
    period = create(:period)
    observation_01 = create(:observation)
    observation_02 = create(:observation)
    period.observations << observation_01

    response = build(:perioding, observation: observation_01, period: period)
    expect(response.valid?).to eq false
    expect(response.errors.full_messages).to eq ["Period has already been taken"]

    period.observations << observation_02
    expect(period.observations.count).to eq 2
  end

  it "observation can not have duplicate periods" do
    observation = create(:observation)
    period_01 = create(:period)
    period_02 = create(:period)
    observation.periods << period_01

    response = build(:perioding, observation: observation, period: period_01)
    expect(response.valid?).to eq false
    expect(response.errors.full_messages).to eq ["Period has already been taken"]

    observation.periods << period_02
    expect(observation.periods.count).to eq 2
  end
end
