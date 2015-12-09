# ufo sigthings scrapping
require 'pry'
require 'mechanize'
require 'csv'

agent = Mechanize.new

url = 'http://localhost:3000/missing.html'
page = agent.get(url)
links = page.links_with(:href => /^http\:\/\/www.doenetwork.org\/cases\/\w+.\w+/)

i = 0 #counter to follow the iterations

def current_page(page)

  p_tag_1 = page.search('p')[1] #paragraph with the personal info

  if page.search('h2 + p')[3] != nil
    p_tag_2 = page.search('h2 + p')[3].content.strip #paragraph with extra details

    # we clean p_tag_1 and make an array
    info_clean = p_tag_1.text.gsub(':','').gsub(';'," ").gsub(')'," ").strip.split("\n")
    # we call the function that works-clean that array 
    final_array = clean_array(info_clean)
    # store the second paragraph
    final_array << p_tag_2
    #we create a multidimensional array

    save_csv(final_array)
  end

end

def current_page_from_array(url_from_array, agent)
  page = agent.get(url_from_array)
  p_tag_1 = page.search('p')[1] #paragraph with the personal info

  if page.search('h2 + p')[3] != nil
    p_tag_2 = page.search('h2 + p')[3].content.strip #paragraph with extra details

    # we clean p_tag_1 and make an array
    info_clean = p_tag_1.text.gsub(':','').gsub(';'," ").gsub(')'," ").strip.split("\n")
    # we call the function that works-clean that array 
    final_array = clean_array(info_clean)
    # store the second paragraph
    final_array << p_tag_2
    #we create a multidimensional array

    save_csv(final_array)
  end
end

def save_csv(final_array)
  CSV.open("/Users/virgilio1974/Desktop/project_IH/scrap_links/missing.csv", "ab") do |csv_file|   
    csv_file << final_array
  end
  puts "record read !"
end

def clean_array(array)
  new_array = []
  new_array[0] = array[0].gsub('Name','').strip
  new_array[1] = array[2].gsub('Missing','').gsub('Since','').gsub(',','').strip
  location = array[3].gsub('Location','').gsub('Last','').gsub('Seen','').split(",") 

  if location.count == 3
    new_array[2] = location[0].strip
    new_array[3] = location[1].strip
    new_array[4] = location[2].strip
  else
    new_array[2] = location[0].strip
    new_array[3] = location[1].strip
  end
  
  new_array

end

# ---------  START ----------
# we read the links
links.each do |link|
  binding.pry
  page =link.click

  puts page.code + "  link_" + (i+1).to_s
  # we call the function to get the info from the page
  current_page(page)
  
  all_links = []
  all_links << link.attributes[:href]
  next_link = all_links.last
  #different method to make new 'get' actions over the URI`s from the array
  # current_page_from_array(next_link, agent)

  i+= 1
end


