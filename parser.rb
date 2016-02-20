require 'rubygems'
require 'mechanize'

module Parsers
  class Lansstyrelsen
    attr_accessor :data

    BASE_URL = 'http://web05.lansstyrelsen.se/stift/StiftWeb/'\
               'FoundationDetails.aspx?id='

    def initialize(limit = nil)
      @limit = limit || 1_000_000_000
      @data = []
      @agent = Mechanize.new do |agent|
        agent.user_agent_alias = 'Mac Safari'
      end
    end

    def get_all_pages(limit_fails = 1_000)
      count_fails, page_num = 0, 1
      loop do

        @page = @agent.get("#{BASE_URL}#{page_num}")
        current_data = scrape_data
        unless current_data["stiftelsenamn"].empty?
          @data << current_data
        else
          count_fails += 1
        end

        break if page_num > @limit || count_fails > limit_fails

        page_num += 1
      end
    end

    # Scrape data from table
    def scrape_data
      rows = @page.search("//tr[contains(@class,'Item')]")
      data = { }
      rows.each do |row|
        cells = row.search("td")
        data[cells.first.text.downcase.gsub(/\\|:/, '')] = cells.last.text
      end
      data
    end
  end
end

# parser = Parsers::Lansstyrelsen.new
# parser.get_all_pages
# pp parser.data