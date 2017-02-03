# declare nested data structure showing inventory of houses in neighborhood
neighborhood_inventory = {
  blue_house_on_corner: {
    status: 'occupied',
    color: 'blue',
    inventory: {
      kitchen: {
                  frig: ['milk', 'cheese', 'yogurt', 'hamburger', 'kale'],
                  stove: {
                    brand: 'Kenmore',
                    brand_slogan: "Solid as Sears"
                    },
                  dishwasher: ['spoons','forks','plates','bowls', 'glasses']
                },
      living_room: ['sofa','tv','rug','lamp'],
      bedroom: ['bed','pillow', 'dresser','nightstand']
            }
    },
  purple_eyesore_house: {
    status: 'no tenants',
    color: 'purple',
    inventory: {
      kitchen: {
                  frig: [],
                  stove: {
                    brand: 'GE',
                    brand_slogan: "We Bring Good Things To Life"
                    },
                  dishwasher: []
                },
      living_room: [],
      bedroom: ['old, rickety chair']
      }
    }
}

# access a few items
puts "first item in dishwasher of blue house: #{neighborhood_inventory[:blue_house_on_corner][:inventory][:kitchen][:dishwasher][0]}"
puts "contents of dishwasher in blue house: #{neighborhood_inventory[:blue_house_on_corner][:inventory][:kitchen][:dishwasher]}"
puts "brand slogan of stove in purple house: #{neighborhood_inventory[:purple_eyesore_house][:inventory][:kitchen][:stove][:brand_slogan]}"
puts "last food item in frig list in blue house: #{neighborhood_inventory[:blue_house_on_corner][:inventory][:kitchen][:frig].last}"
puts "status of purple house: #{neighborhood_inventory[:purple_eyesore_house][:status]}"