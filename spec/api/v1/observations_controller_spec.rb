RSpec.describe '/api/v1/observations_controller', type: :request do
  let(:user) { create(:user) }
  let(:headers) { { "ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" } }
  let(:data) { JSON.parse(response.body) }

  it "index" do
    keyword = "鳥"
    observation_01 = create(:observation, taxon_name: "憤怒鳥")
    observation_02 = create(:observation, taxon_name: "快樂鳥")
    params = { keyword: keyword }
    get '/api/v1/observations', params: params, headers: headers
    expect(response).to have_http_status(:success)
    expect(data["observations"].first["observation"]["taxon_name"]).to eq observation_02.taxon_name
    expect(data["observations"].last["observation"]["taxon_name"]).to eq observation_01.taxon_name
  end


end

