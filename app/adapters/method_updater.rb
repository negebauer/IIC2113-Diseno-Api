module MethodUpdater
  class MethodUpdater
    def self.methodologies
      page_agent = Methodologies::Crawler.page_agent
      Methodologies::Scraper.obtain(page_agent)
    end

    def self.specific_method(method_name)
      page_agent = Object.const_get(method_name)::Crawler.page_agent
      Object.const_get(method_name)::Scraper.obtain(page_agent, method_name)
    end
  end
end
