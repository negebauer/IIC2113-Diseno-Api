module Methodologies
  class Scraper < AbstractScraper
    def self.obtain(page_agent, _name = nil)
      selector_string = '#panel-122-2-0-0 > div > div.row > div > '\
                        'div.blocks-tipo4 > h4 > a'
      buffer_tag = search_by_selector(selector_string, page_agent[:page_agent])
      parse_methods(buffer_tag)
    end

    def self.parse_methods(html_a)
      methods = []
      html_a.each do |method|
        methods << { name: method.text, url: method[:href] }
      end
      methods
    end
  end
end
