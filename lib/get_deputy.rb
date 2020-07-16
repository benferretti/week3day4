require 'nokogiri'
require 'open-uri'
require 'pry'

def get_deputy_email(deputy_url)
	page = Nokogiri::HTML(open(deputy_url))
	email = page.xpath ('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
	return email.text
end

def get_deputy_urls 
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	url = page.xpath('//a[contains(@href, "/deputes/fiche")]')
	urls_array = Array.new
	deputies_array = Array.new
	result = Hash.new
	url.each { |i| urls_array << "http://www2.assemblee-nationale.fr"+(i[:href])[0..-1]}
	url.each { |i| deputies_array << i.text}
	deputies_array.each_with_index {|k,i|result[k] = urls_array[i]}
	return result
end


def array_of_data
	result = get_deputy_urls
	final_array = Array.new	
	#appel de la première méthode avec les urls récoltés lors de la 2e méthode
	result.each do |i, k| 
		final_array <<  { "first_name" => i.split(' ')[1], "last_name" => i.split(' ')[2], "email" => get_deputy_email(k) } 
	end
	return final_array.each do |i|
			i
	end
end

array_of_data

