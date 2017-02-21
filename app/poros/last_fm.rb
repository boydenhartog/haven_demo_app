
class LastFm
  include ActiveModel::Model
  attr_reader :results, :error_notice
  attr_accessor :query, :page, :response
  validates :query, presence: true

  def perform
    url = 'http://ws.audioscrobbler.com/2.0/'
    options = { method: 'artist.search', artist: query, api_key: ENV["LASTFM_API_KEY"], format: 'json' }
    @response = HTTParty.get(url, query: options)
    raise_errors

    if @error_notice.nil?
      @results = @response.parsed_response['results']['artistmatches']['artist'].map { |artist| artist  }
    end
  end

  def raise_errors
    case @response.code.to_i
      when 400
        @error_notice = "Last.FM returned 400 error: #{response.message}"
      when 403
        @error_notice = "Last.FM returned 403 error: #{response.message}"
      when 404
        @error_notice = "Last.FM returned 404 error"
    end
  end
end
