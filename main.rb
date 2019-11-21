#!/usr/bin/env ruby

# frozen_string_literal: true

require 'rest-client'

class Bing
  def search(input)
    return 'no search term given' unless input

    search_term = format(input)
    base = 'https://www.bing.com/search'
    response = RestClient.get(base, params: { q: search_term })

    if response.code == 200
      puts response.body
    else
      puts 'error fetching search result'
    end
  end

  private

  def format(text)
    text.split(' ').join('+')
  end
end

bing_search = Bing.new
puts 'enter your search_'
search_query = gets.chomp
bing_search.search(search_query)
