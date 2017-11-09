class AbstractCrawler
  def self.get_page(url)
    agent = Mechanize.new
    agent.get(url) do |page|
      return Nokogiri::HTML(page.body)
    end
  rescue
    return "Couldn't connect"
  end
end
