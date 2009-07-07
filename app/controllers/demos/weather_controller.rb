class WeatherController < ApplicationController
  URL = 'http://weather.yahooapis.com/forecastrss?p='
  def index
    respond_to do |format|  
        format.xml {  }  
    end    
  end
  
  def forcast
    @zip     = params[:Digits]
    @weather = get_weather
    respond_to do |format|  
        format.xml {  }  
    end    
  end
  
  protected
  def get_weather
    parse_weather(Net::HTTP.get_response(URI.parse("#{URL}#{@zip}")).body.to_s)
  end
  def parse_weather(body)
    # Avoiding using an xml parser
    title_match = body.match /<title>(.*)<\/title>/
    title       = $1
    temp_match  = body.match /temp="(\d*)"/
    temp        = $1
    {:temp => temp, :title => title}
  end
end