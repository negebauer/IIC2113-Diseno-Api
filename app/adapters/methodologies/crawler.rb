module Methodologies
  class Crawler < AbstractCrawler
    def self.page_agent
      url = 'https://www.escuelaenmovimiento.cl/metodologias-innovadoras'
      page_agent = get_page(url)
      { page_agent: page_agent }
    end
  end
end
