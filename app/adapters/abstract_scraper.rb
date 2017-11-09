# Abstract class for HTML scraping methods
class AbstractScraper
  def self.search_by_selector(selector_string, page_agent)
    buffer_tag = page_agent
    tags = selector_string.split(' > ')
    tags.each do |tag|
      buffer_tag = buffer_tag.search(tag) unless tag == 'tbody'
    end
    buffer_tag
  end
end
