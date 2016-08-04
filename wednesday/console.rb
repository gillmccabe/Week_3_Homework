require_relative('./models/pets')
require_relative('./models/petstore')

require( 'pry-byebug')

petstore1 = PetStore.new( { 'name' => 'Wizard of Paws', 'address' => '200 Bank Street', 'stock_type' => 'dogs'} )
petstore1.save()

pets1 = Pets.new( { 'name' => 'Bob', 'type' => "dog", 'petstore_id' => petstore1.id } )
pets1.save()






binding.pry
nil