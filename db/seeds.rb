def set_bp_attributes(batch, name, number, note)
  batch.batch_products
   .includes(:product)
   .where(products: {name: name})
   .first
   .update(
     threshold: number,
     note: note
   )
end

Forecast.delete_all
puts "Deleting forecasts..."
Delivery.delete_all
puts "Deleting deliveries..."
BatchProduct.delete_all
puts "Deleting batch_products..."
Batch.delete_all
puts "Deleting a batch..."
Product.delete_all
puts "Deleting products..."

puts "Creating a batch..."
batch = Batch.create!(
  city: "Paris",
  number: 500,
  headcount: 42,
  start_date: '09-01-2019',
  end_date: '11-03-2019'
)
puts "#{Batch.count} batches created!"

puts "Creating products..."
Product.create!(
  [
    { name: "Beer", description: "Wagon's favorite drink!", emoji: "🍺" },
    { name: "Toilet Paper", description: "Let's keep things clean", emoji: "🧻" },
    { name: "Coffee", description: "Code fuel", emoji: "☕️" }
  ]
)
puts "#{Product.count} products created!"

puts "Creating batch_products..."
batch.products = Product.all
batch.save!

set_bp_attributes(batch, "Beer",42, "Bottles")
set_bp_attributes(batch, "Toilet Paper", 42, "Rolls")
set_bp_attributes(batch, "Coffee", 5, "Kilos")


Delivery.create!(
  [
    {date: (Date.today - 51), qty: 80, note: '', batch_product: BatchProduct.first},
    {date: (Date.today - 40), qty: 85, note: '', batch_product: BatchProduct.first},
    {date: (Date.today - 36), qty: 115, note: '', batch_product: BatchProduct.first},
    {date: (Date.today - 15), qty: 50, note: '', batch_product: BatchProduct.first},
    {date: (Date.today - 9), qty: 70, note: '', batch_product: BatchProduct.first}
  ]
)
