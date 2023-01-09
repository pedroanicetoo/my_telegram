class RandomGif
  BASE_URI = Rails.application.secrets[:giphy][:base_uri]
  RANDOM_GIPHY = Rails.application.secrets[:giphy][:random_uri]
  API_KEY = Rails.application.secrets[:giphy][:api_key]

  attr_reader :tag

  def initialize(tag:)
    @tag = tag
  end

  def url
    JSON.parse(res.body).dig('data', 'images', 'original', 'mp4')
  end

  private

  def uri
    @uri ||= URI.parse("#{BASE_URI}#{RANDOM_GIPHY}?api_key=#{API_KEY}&tag=#{tag}")
  end

  def http
    @http ||= Net::HTTP.new(uri.host, uri.port)
  end

  def req
    @req ||= Net::HTTP::Get.new(uri)
  end

  def res
    @res ||= http.request(req)
  end

end
