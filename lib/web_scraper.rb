class WebScraper
  #Reqs
  require 'httparty'
  require 'open-uri'
  require 'nokogiri'
  require 'json'
  # require 'Pry'
  require 'csv'

  #Fake User Agent so we look normal-ish
  AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

  #Methods
  def write_json(json)
    File.open("public/event.json","w") do |f|
      f.write(json.to_json)
    end
  end

  def craigslist(board, query)
    #Config
    cl_places = ["sandiego", "washingtondc", "sfbay", "seattle", "sacramento", "raleigh", "portland", "phoenix", "philadelphia", "orangecounty", "newyork", "miami", "minneapolis", "losangeles", "lasvegas", "houston", "detroit", "denver", "dallas", "chicago", "boston", "austin", "atlanta"]
    cl_base_url = ".craigslist.org/search/#{board}"
    cl_per_page = 120
    links_array =[]
    pages_array = []

    #Build Array of PAges
    cl_places.each do |place|
      #Set Base Data
      specific_base_url = "https://"+place+cl_base_url
      page = HTTParty.get(specific_base_url)
      parsed = Nokogiri::HTML(page)

      #Collect total num of listings
      total_listings = parsed.css(".totalcount").children.first.text
      puts "Building Page Listing for #{place}"

      (1..(total_listings.to_i/cl_per_page)).each do |i|
        pages_array.push(specific_base_url+"?s=#{i*cl_per_page}")
      end
    end

    pages_array.each do |page|
      parsed_page = Nokogiri::HTML(HTTParty.get(page, headers: {"User-Agent" => AGENT}))
      puts "Digging through #{page}..."

      parsed_page.css(".result-info").map do |a|
        hood = a.css(".result-hood")
        link = a.css(".hdrlnk")
        if hood.text =~ query || link.text =~ query
          links_array.push({
              job_title: link.text,
              created_at: a.css(".result-date").first.attributes["datetime"].value,
              job_description: link.to_json
          })
        end
      end
    end

    write_json(links_array)
  end

  def we_work_remotely(category)

  end

  def remoteworkhub(category)

  end

  def remoteok(category)

  end

  def remoteok(category)

  end

  def virtualvocations()

  end

  def workingnomads(query)
    #Initial Grab
    url = "https://www.workingnomads.co/jobsapi/job/_search?sort=pub_date:desc&_source=company,description,location_base,slug,title,pub_date,apply_url&size=25&from=0&q=#{query}"
    page = HTTParty.get(url)
    results = JSON.parse page.body

    #listings config
    total_contents = results["hits"]["total"]
    listings = results["hits"]["hits"]
    results = []

    listings.each do |l|
      result = l['_source']
      results.push({
          job_title: result["title"],
          created_at: result["pub_date"],
          job_description: result["description"],
          how_to_apply: result["apply_url"],
          company: result["company"],
          location: result["location_base"],
          source_id: l["_id"]
      })
    end

    return results
  end

end

# @scraper=WebScraper.new
# # #@scraper.craigslist("jjj", /remote|Remote/)
# # Pry.start(binding)
