x = Dir.entries "G:\\XAMPP\\htdocs\\ruby\\"   # Выводим содержимое каталога
print x
find = Dir["*.txt"]   #Поиск файлов помаске 
puts "\n #{find}"
print File.read("1.txt")  #выводим содержимаое файла

# Заносим запись в коец файла
=begin
File.open("1.txt", "a") do |f|   
    f << "\n New string"
end
=end
puts
puts File.mtime("1.txt")  #Выводим дату создания файла