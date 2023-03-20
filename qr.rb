require "rqrcode"
puts "What kind of QR code would you like to generate?

1. Open a URL
2. Join a wifi network
3. Send a text message"
choice = gets.chomp

if choice == "1"
p "Enter a url"
url = gets.chomp
p "What would you like to call the PNG?"
png_name = gets.chomp
qrcode = RQRCode::QRCode.new("#{url}")
png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{png_name}.png", png.to_s)


elsif choice == "2"
p "What is the name of the wifi network?"
network_name = gets.chomp
p "What is the password"
password = gets.chomp
p "What would you like to call the PNG?"
png_title = gets.chomp
qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network_name};P:#{password};;")
png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{png_title}.png", png.to_s)


elsif choice == "3"
p "What is the phone number you want the code to send a text message to?"
phone_number = gets.chomp
p "What do you want to populate the message with?"
message_content = gets.chomp
p "What would you like to call the PNG?"
png_filename = gets.chomp


qrcode = RQRCode::QRCode.new("SMSTO:#{phone_number}:#{message_content}")
png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{png_filename}.png", png.to_s)

else
  exit
end
