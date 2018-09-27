namespace :quote do
  desc 'Get All Quotes'
  task get_all_qoute: :environment do
    response = RestClient.get 'http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=30'
    Quote.search_or_save(response)
  end
end


