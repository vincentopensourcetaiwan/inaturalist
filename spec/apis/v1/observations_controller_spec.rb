RSpec.describe '/apis/v1/observations_controller', type: :request do
  let(:headers) { { "ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" } }
  let(:data) { JSON.parse(response.body) }

  it "index" do
    keyword = "鳥"
    create(:observation, taxon_name: keyword)
    params = { keyword: keyword }
    get '/apis/v1/observations', params: params, headers: headers
    expect(response).to have_http_status(:success)
  end
end

