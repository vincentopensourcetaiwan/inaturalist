# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Tag, type: :model do
  it "a tag has many observations" do
    tag = create(:tag)
    observation_01 = create(:observation)
    observation_02 = create(:observation)
    tag.observations << observation_01
    tag.observations << observation_02
    expect(tag.observations.count).to eq 2
  end

  it "a observation has many tags" do
    observation = create(:observation)
    tag_01 = create(:tag)
    tag_02 = create(:tag)
    observation.tags << tag_01
    observation.tags << tag_02
    expect(observation.tags.count).to eq 2
  end

  it "tag can not have duplicate observation" do
    tag = create(:tag)
    observation_01 = create(:observation)
    observation_02 = create(:observation)
    tag.observations << observation_01

    response = build(:tagging, observation: observation_01, tag: tag)
    expect(response.valid?).to eq false
    expect(response.errors.full_messages).to eq ["Tag has already been taken"]

    tag.observations << observation_02
    expect(tag.observations.count).to eq 2
  end

  it "observation can not have duplicate tags" do
    observation = create(:observation)
    tag_01 = create(:tag)
    tag_02 = create(:tag)
    observation.tags << tag_01

    response = build(:tagging, observation: observation, tag: tag_01)
    expect(response.valid?).to eq false
    expect(response.errors.full_messages).to eq ["Tag has already been taken"]

    observation.tags << tag_02
    expect(observation.tags.count).to eq 2
  end

end
