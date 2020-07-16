require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath ('html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	return email.text
end


def get_townhall_urls 
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	url = page.xpath('//a[contains(@href, "./")]')
	urls_array = Array.new
	cities_array = Array.new
	result = Hash.new
	url.each { |i| urls_array << "http://annuaire-des-mairies.com"+(i[:href])[1..-1]}
	url.each { |i| cities_array << i.text}
	cities_array.each_with_index {|k,i|result[k] = urls_array[i]}
	return result
end

def array_of_data
	result = get_townhall_urls
	final_array = Array.new	

	#appel de la première méthode avec les urls récoltés lors de la 2e méthode, implementation des arrays	
	result.each do |i, k|
		final_array <<  {i => get_townhall_email(k)} 
	end

	return final_array.each do |i|
			p i
	end
end

