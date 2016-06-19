people = 30
cars = 40
trucks = 15

cars >= people ? (puts "We should take the cars.") : (puts "We should not take the cars.")
trucks >= cars ? (puts "That's too many trucks.") : (puts "Maybe we could take the trucks.")
people >= trucks ? (puts "Alright, let's just take the trucks.") : (puts "Fine, let's stay home then.")
