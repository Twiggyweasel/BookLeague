class BookSearchReflex < ApplicationReflex
  def perform(query="")
    return unless query.size > 2

    result = HTTP.get("http://openlibrary.org/search.json?#{{title: query}.to_query}")
    @books = JSON.parse(result.to_s) if result.status == 200
  end
end
