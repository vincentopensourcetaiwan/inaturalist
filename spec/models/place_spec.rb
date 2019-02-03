# == Schema Information
#
# Table name: places
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  chinese_name :string
#  longitude    :float
#  latitude     :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

RSpec.describe Place, type: :model do
  it "a place has many observations" do
    place = create(:place)
    observation_01 = create(:observation)
    observation_02 = create(:observation)
    place.observations << observation_01
    place.observations << observation_02
    expect(place.observations.count).to eq 2
  end

  it "a observation has many places" do
    observation = create(:observation)
    place_01 = create(:place)
    place_02 = create(:place)
    observation.places << place_01
    observation.places << place_02
    expect(observation.places.count).to eq 2
  end

  it "place can not have duplicate observation" do
    place = create(:place)
    observation_01 = create(:observation)
    observation_02 = create(:observation)
    place.observations << observation_01

    response = build(:placing, observation: observation_01, place: place)
    expect(response.valid?).to eq false
    expect(response.errors.full_messages).to eq ["Place has already been taken"]

    place.observations << observation_02
    expect(place.observations.count).to eq 2
  end

  it "observation can not have duplicate places" do
    observation = create(:observation)
    place_01 = create(:place)
    place_02 = create(:place)
    observation.places << place_01

    response = build(:placing, observation: observation, place: place_01)
    expect(response.valid?).to eq false
    expect(response.errors.full_messages).to eq ["Place has already been taken"]

    observation.places << place_02
    expect(observation.places.count).to eq 2
  end

end