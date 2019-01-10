class WikipediaService
  ONLY_ENGLISH_AND_NUMBER = /^[A-Za-z0-9 ]*$/

  def self.get_chinese_taxon_name(taxon_name)
    url = "https://zh.wikipedia.org/zh-tw/#{taxon_name}"
    real_url = URI.encode(url)
    uri = URI.parse(real_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    doc = Nokogiri::HTML(response.body)
    name = doc.css("h1").first.text
    name.match(ONLY_ENGLISH_AND_NUMBER).present? ? nil : name
  end

end
