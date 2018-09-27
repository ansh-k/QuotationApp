class Quote < ApplicationRecord
  validates :title, :content, uniqueness: true

  def self.search_or_save(response)
    result = JSON.parse(response)
    result.each do |r|
	    attr = { title: r['title'], content: r['content'], link: r['link'] }
	    attr.merge({ source: r['custom_meta']['Source'] }) if r['custom_meta'].present?
	    Quote.find_by_title_and_content(r['title'], r['content']) || Quote.create(attr)
  	end
  end
end
