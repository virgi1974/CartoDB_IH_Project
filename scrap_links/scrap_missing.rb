# ufo sigthings scrapping
require 'pry'
require 'mechanize'
require 'csv'

agent = Mechanize.new

url = 'http://www.doenetwork.org/'
page = agent.get(url)

array_temp = [] 

frames = page.search('frame') 
binding.pry
# data.each do |t_data|
#   array_temp << t_data.text.strip
# end

# final_array = array_temp.each_slice(7).to_a




# a = document.getElementsByTagName('frame')[1]
# a.contentDocument.getElementsByTagName("table")

# document.getElementsByTagName('frame')[1].contentDocument.getElementsByTagName("table")









