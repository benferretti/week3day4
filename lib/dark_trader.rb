require 'nokogiri'
require 'open-uri'
require 'pry'

def connect_to_url 
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return page
end

def fetch_and_stock_data
	page = connect_to_url
	crypto_name_array = Array.new
	crypto_value_array = Array.new
	list = Hash.new
	all_cryptos_name = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')
	all_cryptos_values = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')
	all_cryptos_name.map { |crypto_name| crypto_name_array << (crypto_name.text) }
	all_cryptos_values.map { |crypto_value| crypto_value_array << (crypto_value.text[1..-1].tr(',', '')).to_f}
	crypto_name_array.each_with_index {|k,i|list[k] = crypto_value_array[i]}
	return list
end

def array_of_data 
	final_array = Array.new	
	list = fetch_and_stock_data
	list.each do |i, k|
		hash = Hash.new	
		hash[i] = k
		final_array << hash
	end
	return final_array.each do |i|
			p i
	end
end

array_of_data