
class LastFm
  include ActiveModel::Model
  
  attr_reader :results
  attr_accessor :query
  validates :query, presence: true

  def perform
    url = 'http://ws.audioscrobbler.com/2.0/'
    options = { method: 'artist.search', artist: query, api_key: ENV["LASTFM_API_KEY"], format: 'json' }
    response = HTTParty.get(url, query: options)
    raise_errors(response)
    @results = response.parsed_response['results']['artistmatches']['artist'].map { |artist| artist  }
  end

  def raise_errors(response)
    case response.code.to_i
      when 400
        raise "400 error: #{response.message}"
      when 403
        raise "403 error: #{response.message}"
      when 404
        raise "404 error"
    end
  end

end
