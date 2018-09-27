require 'rest-client'
class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    system "rake quote:get_all_qoute" if Quote.count == 0
    @quote = Quote.first
  end

  def get_another_quote
    @quote = Quote.order("RANDOM()").first
  end
end

