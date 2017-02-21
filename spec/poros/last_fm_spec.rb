require 'rails_helper'

RSpec.describe LastFm, type: :model do
  describe 'Call LastFM api' do
    before do
      @last_fm = LastFm.new(query: "Tiesto")
    end

    it 'gets a 200 response after valid search' do
      VCR.use_cassette 'poros/api_response' do
        @last_fm.perform
        expect(@last_fm.response.code).to eq(200)
      end
    end

    it 'returns results with valid search' do
      VCR.use_cassette 'poros/api_response' do
        @last_fm.perform
        expect(@last_fm.results.count).to be > 0
      end
    end    

   it 'returns no results when nothing is found' do
      VCR.use_cassette'poros/api_response' do
        @last_fm.query = 'sadfksdfljkfsdjlfjlkfsdajlkfsd'
        @last_fm.perform
        expect(@last_fm.results.count).to be 0
      end
    end 

    it 'gets a 400 response after invalid search' do
      VCR.use_cassette 'poros/api_response' do
        @last_fm.query = ''
        @last_fm.perform
        expect(@last_fm.response.code).to eq(400)
      end
    end

    it 'gets a 403 response with invalid api_key' do
      VCR.use_cassette 'poros/api_response' do
        ENV["LASTFM_API_KEY"] = "definitely_invalid"
        @last_fm.perform
        expect(@last_fm.response.code).to eq(403)
      end
    end    
  end
end