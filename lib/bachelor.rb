require 'pry'
require 'json'
file = File.read('./spec/fixtures/contestants.json')
contestants = JSON.parse(file)

def all_contestants(data)
  everybody = []
  data.map do |season, contestants|
    everybody.concat(contestants)
  end
  everybody
end

def get_first_name_of_season_winner(data, season)
  # code here
  contestant = data[season].find {|first| first["status"] == "Winner"}
  contestant["name"].split.first
end

def get_contestant_name(data, occupation)
  # code here
  data.each do |season, contestants|
   job_lady = contestants.find {|contestant| contestant["occupation"] == occupation}
    return job_lady["name"] if job_lady
  end
end

def count_contestants_by_hometown(data, hometown)
  contestants = all_contestants(data)
  count = 0
    contestants.filter {|contestant| count += 1 if contestant["hometown"] == hometown}
    return count
end

def get_occupation(data, hometown)
  # code here
  contestants = all_contestants(data)
    contestants.find {|contestant| contestant["hometown"] == hometown}["occupation"]
end

def get_average_age_for_season(data, season)
  # code here
    all_ages = data[season].collect {|contestant| contestant["age"].to_f}.sum
    avg_age = all_ages/data[season].length
    avg_age.round
end
