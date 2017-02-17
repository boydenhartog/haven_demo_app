class LastFmsController < ApplicationController
	def show
	  if search_params = params[:last_fm] && params[:last_fm][:query]
	    @last_fm = LastFm.new(query: search_params)
	    @last_fm.perform if @last_fm.valid?
	    #Show error in case API fails 
	    flash['notice'] = @last_fm.error_notice if @last_fm.error_notice
	  else
	    @last_fm = LastFm.new
	  end
	end
end