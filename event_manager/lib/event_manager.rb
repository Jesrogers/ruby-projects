require 'csv'

puts 'EventManager Initialized!'

small_attendees_list = 'event_attendees.csv'

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end

if File.exist?(small_attendees_list)
  contents = CSV.open(small_attendees_list,
                      headers: true,
                      header_converters: :symbol)

  contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]

    clean_zipcode(zipcode)

    puts "#{name}, #{zipcode}"
  end
end


