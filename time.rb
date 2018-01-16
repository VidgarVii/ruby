time=Time.now.min+20
t_ost = Time.now.min%5
if time == 0 || time >= 5 && time <= 20
    the_end = ""
elsif t_ost == 1
    the_end = "a"
elsif t_ost >=2 && t_ost <=4
    the_end = "ы"
else
    the_end = ""
end

puts "#{time} минут#{the_end}"