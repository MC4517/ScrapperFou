require 'nokogiri'
require 'open-uri'

 #def get_the_email_of_a_townhal_from_its_webpage (townhal_url)

 def get_townhall_url
   page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

  @mairies_nameS = page.xpath('//td[1]/p/a | //td[2]/p/a | //td[3]/p/a').map do 
   |mairie| mairie.text.downcase.tr(' ','-')
  end
end

def get_townhall_email
 mairies_mailS = @mairies_nameS.map do |ville|
  page_2 = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/#{ville}.html"))
  page_2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map do |mail|
   mail.content
    end
  end
end
  

def hash(mairies_nameS, mairies_mailS)
 hash = Hash[mairies_nameS.zip(mairies_mailS)]
end

puts hash(get_townhall_url, get_townhall_email)



