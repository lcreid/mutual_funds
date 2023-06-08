# frozen_string_literal: true

require_relative "mutual_funds/version"
require "httparty"
require "pry-byebug"
require "nokogiri"

module MutualFunds
  class Error < StandardError; end

  class << self
    def get_one_fund(fund)
      query = "https://marketsandresearch.td.com/tdwca/Public/MutualFundsProfile/Summary/ca/#{fund}?addRecent=true"
      response = HTTParty.get(query)
      puts response.body and return if response.code != 200
      # response.force_encoding("UTF-8")
      doc = Nokogiri.HTML5(response)
      # doc.xpath("//span[@vkey='NAV']").text.strip
      doc.xpath("//span[text()='NAV']/following-sibling::div/span").text
    end
  end
end
