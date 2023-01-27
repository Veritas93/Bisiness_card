require 'rexml/document'

current_path = File.dirname(__FILE__)
file_name = current_path + '/business_card.xml'

abort 'Не удалось найти визитку' unless File.exist?(file_name)

# Открываем файл и создаем из его содержимого REXML - объект
file = File.new(file_name, 'r:UTF-8')
doc = REXML::Document.new(file)
file.close

# Теперь мы сможем достать любое поле нашей визитки с помощью методов объекта doc
# Например, doc.root.elements["first_name"].text
# запишем все поля в ассоциативном массиве

card = {}

# Обратим внимание, что ключами в нашем массиве будут не метки, а строки 
['first_name', 'second_name', 'last_name', 'phone', 'email', 'skills'].each do |feild|
  card[feild] = doc.root.elements[feild].text
end

# Вывод визитки в консоль
puts "#{card['first_name']} #{card['second_name'][0]} #{card['last_name']}"
puts "#{card['phone']} #{card['email']}"
puts "#{card['skills']}"
