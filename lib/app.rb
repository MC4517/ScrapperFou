
require 'nokogiri'
require 'open-uri'

def cours_crypto 
  
  doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all'))
  crypto_symbol = doc.xpath("//td[3]| //td[5]").map  do |crypto|  
    crypto.text
  
  end
end

  def array(crypto_symbol)
 i = 0
 a = []
while i < 399 
  
    a << Hash[crypto_symbol[i],crypto_symbol[i+1]]
    i = i + 2 
    
  end
return a
end

def perform
  cours_crypto
  array(cours_crypto)
end

 perform


