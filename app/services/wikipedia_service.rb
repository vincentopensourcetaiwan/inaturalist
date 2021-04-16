class WikipediaService
  def self.get_chinese_taxon_name(taxon_name)
    url = "https://zh.wikipedia.org/zh-tw/#{taxon_name.gsub(" ", "%20")}"
    response = Faraday.get url
    doc = Nokogiri::HTML(response.body)
    return "" unless response.status == 200
    doc.css("h1").first.text
  end
end
