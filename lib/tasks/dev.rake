namespace :dev do

  task :generate_cats => :environment do
    Cat.delete_all

    cats = [
      { name: "Cat1", image: "img/cat1.jpg" },
      { name: "Cat2", image: "img/cat2.jpg" },
      { name: "Cat3", image: "img/cat3.jpg" },
      { name: "Cat4", image: "img/cat4.jpg" },
      { name: "Cat5", image: "img/cat5.jpg" },
    ]

    cats.each do |cat|
      puts "Create cat #{cat}"
      Cat.create!( :name => cat[:name], :image => cat[:image] )
    end
  end

  task :fake => :environment do
    puts "Generate development data!"

    100.times do
      Product.create!( :name => Faker::Commerce.product_name,
                       :friendly_id => SecureRandom.uuid,
                       :price => Faker::Commerce.price * 100,
                       :stock_qty => rand(100),
                       :description => Faker::Lorem.paragraph,
                       :image_url => Faker::Avatar.image
                     )
    end
  end

end
