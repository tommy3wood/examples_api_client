class Api::ArticlesController < ApplicationController
  def index
    search_term = params[:search] 
    response = HTTP
                    .headers("X-Api-Key" => "9d8d763bee474258b084bc58edff2dfd")
                    .get("https://newsapi.org/v2/everything?q=#{ search_term }")
    @articles = response.parse
    render 'index.json.jb'
  end
end
