flavors = %w[chocolate vanilla neapolitan coconut pistachio cherry hazelnut ]

topping = %w[sprinkles nuts capncrunch marshmallows]

consumers = %w[Brian Sarah]

country = %w[Ireland Sweden Canada Iceland Indonesia Singapore Argentina]
10.times do
  IceCream.create(flavor: flavors.sample, topping: topping.sample, consumer: consumers.sample, country: country.sample)
end



