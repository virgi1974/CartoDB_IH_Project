require 'pry'
require 'mechanize'
require 'csv'

mechanize = Mechanize.new

page = mechanize.get('http://www.nuforc.org/webreports/ndxevent.html')

#links = page.links # all the links,we don`t want neither the first neither the last one!!!!
links = page.links[1..-2] 


def current_page(page)

  array_temp = [] 
  data = page.search('tr td') 

  data.each do |t_data|
    array_temp << t_data.text.strip
  end

  final_array = array_temp.each_slice(7).to_a
  save_csv(final_array)
end


def save_csv(final_array)
  CSV.open("/Users/virgilio1974/Desktop/project_IH/scrap_links/ufo.csv", "ab") do |csv_file|
    
    final_array.each do |row|
      csv_file << row
    end
    puts "file read !"
  end

end

# we read the links
links.each do |link|
  page =link.click
  current_page(page)
end

