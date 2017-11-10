class AbstractCrawler
  def self.get_page(url)
    agent = Mechanize.new
    agent.open_timeout = 10
    agent.read_timeout = 10
    agent.get(url) do |page|
      return Nokogiri::HTML(page.body)
    end
  rescue
    return "Couldn't connect"
  end
end
