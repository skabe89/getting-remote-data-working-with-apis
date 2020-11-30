require 'net/http'
require 'open-uri'
require 'json'
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    programs = JSON.parse(self.get_programs)
    programs.collect{|program| program["agency"]}
  end

  def program_number
    programs = JSON.parse(self.get_programs)
    programs.collect{|program| puts "School: #{program["agency"]}, Number: #{program["contact_number"]}"}
  end

end

# programs = GetPrograms.new.get_programs
# puts programs

programs =GetPrograms.new
puts programs.program_school.uniq
puts programs.program_number.uniq
