require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
deputy_list = page.xpath('//a[contains(@href, "OMC")]/@href')

deputy_array = []
deputy_link = deputy_list.map do |omc|
page_2 = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/#{omc}"))
    
  page_2.xpath('//h1 | //dd[4]/ul/li[2]/a').map do |info|
    info.content.strip.split(' ').delete_if{|i| i == "M." || i == "Mme" }.map do |elements|
      deputy_array << elements
    end
  end
end
    i = 0
  array =[]
  while deputy_array[i] != nil do 
    array << Hash["first_name",deputy_array[i],"last_name", deputy_array[i+1], "mail",deputy_array[i+2]]
      i = i + 3
    end

    puts array

