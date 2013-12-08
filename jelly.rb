#======Jellyvision Ruby Developer Internship Challenge======== 
f = File.read("/Users/jeromecjohnson/Documents/JelliVision/db/jellivision_test.txt")

lines = []

f.each_line do |s|
  lines << s.split(" ")
end

songs = []

lines.each do |song|
  songs << song[6]
end


song_count = Hash.new(0)

status_codes = []
status_code_count = Hash.new(0)

user_agents = []
user_agents_count = Hash.new(0)

#Counts the number of times each song appears
songs.each do |n|
  song_count[n] += 1
end

#Displays each song with a count greater or equal to 150
puts "*** Songs with count of at least 150: ***"
song_count.each do |k,v|
  puts "#{k} was played #{v} times" if v >= 150
end
puts "=============================================================================="
puts " "
puts " "

#displays total number of songs in log
total_songs = songs.count
puts "*** There are #{total_songs} total songs ***"
puts "==============================================================================="
puts " "
puts " "

## Display's top 10 files as a percentage of all files in log
puts "*** Top 10 files and percentage played: ***"
song_count.each do |k,v|
  puts "#{k} was played  as #{(((v.to_f/total_songs).to_f)*100).round(4)}% of all files" if v >= 192
end

puts "==============================================================================="
puts " "
puts " "
lines.each do |status|
  status_codes << status[8]
end

#Counts number of times each unique status code appears
status_codes.each do |code|
  status_code_count[code] += 1
end

# Displays all HTTP status codes by percentage
puts "*** Status codes and percentage of times they appear: ***"
status_code_count.each do |k,v|
  puts "Status code #{k} appears at a rate of #{(((v.to_f/total_songs).to_f)*100).round(2)}%"
end

puts "======================================================================================"
puts " "
puts " "

lines.each do |user|
  user_agents << user[9]
end

#Counts the number of times each unique user agent appears
user_agents.each do |c|
  user_agents_count[c] += 1
end

#Displays each unique user agent as percentage of times it apperas in log
puts "*** Unique user agents as percentage of files played ***"
user_agents_count.each do |k,v|
  puts "User agent #{k} appears at a rate of #{(((v.to_f/total_songs).to_f)*100).round(4)}%" unless k == "-"
end

















