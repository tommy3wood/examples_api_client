class Api::ArticlesController < ApplicationController
  def index
    search_term = params[:search] 
    response = HTTP
                    .headers("X-Api-Key" => Rails.application.credentials.news_api[:api_key])
                    .get("https://newsapi.org/v2/everything?q=#{ search_term }")
    @articles = response.parse
    render 'index.json.jb'
  end
end
