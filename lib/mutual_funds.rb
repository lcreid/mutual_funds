# frozen_string_literal: true

require_relative "mutual_funds/version"
require "httparty"
require "pry-byebug"
require "nokogiri"

module MutualFunds
  class Error < StandardError; end

  class << self
    def get_one_fund(fund)
      query = "https://quotes.morningstar.com/fund/c-header?t=#{fund}"
      response = HTTParty.get(query)
      response.force_encoding("UTF-8")
      doc = Nokogiri.HTML5(response)
      doc.xpath("//span[@vkey='NAV']").text.strip
    end
  end
end
