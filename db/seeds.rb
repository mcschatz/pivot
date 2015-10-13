# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{title: "Profit"}, {title: "Business"}, {title: "Education"}, {title: "Technology"}, {title: "Sporting goods"}, {title: "Travel"}, {title: "Home Furnishings"}, {title: "Small Business"}])


category_set = [*1..20].each.with_object([]) do |item, cat_set|
    count = rand(1..5)
    cat_set << [].push(categories.sample(count))
end

items = Item.create([{title: 'pencil', description: 'bulk pencils', price: 1020, image: 'http://globe-views.com/dcim/dreams/pencil/pencil-01.jpg', categories: Category.all.sample(5)},
                     {title: 'haircut', description: 'the most stylish', price: 1599, image: 'http://i.imgur.com/O9vhcWK.jpg', categories: Category.all.sample(5)},
                     {title: 'junk', description: 'some junk', price: 2099, image: 'http://i.imgur.com/xGA7FqN.jpg?1', categories: Category.all.sample(5)},
                     {title: 'internet', description: 'not worth the price', price: 6016, image: 'http://i.imgur.com/thpZjxj.jpg', categories: Category.all.sample(5)},
                     {title: 'dog', description: 'bark', price: 0010, image: 'http://i.imgur.com/MU2dD8E.jpg', categories: Category.all.sample(5)},
                     {title: 'tree', description: 'also bark', price: 2399, image: 'http://i.imgur.com/zSMlhaL.jpg', categories: Category.all.sample(5)},
                     {title: 'swimming lessons', description: 'just don\'t drown', price: 799, image: 'http://i.imgur.com/dBKJup1.jpg', categories: Category.all.sample(5)},
                     {title: 'real movies', description: 'nah, its the real thing', price: 1999, image: 'http://i.imgur.com/a5MK3cu.jpg', categories: Category.all.sample(5)},
                     {title: 'gum wrapper', description: 'the worst part of a stick of gum', price: 9999, image: 'http://i.imgur.com/YX6Ailv.jpg', categories: Category.all.sample(5)},
                     {title: 'cat', description: 'the internet likes these for some reason', price: 1, image: 'http://i.imgur.com/0LINzxs.jpg', categories: Category.all.sample(5)},
                     {title: 'wet cardboard', description: 'just useless enough to be on the internet', price: 1337, image: 'http://i.imgur.com/C8SukFQ.jpg', categories: Category.all.sample(5)},
                     {title: 'sleep', description: 'what I should be doing right now', price: 9999, image: 'http://i.imgur.com/LBfAioO.jpg', categories: Category.all.sample(5)},
                     {title: 'broken fork', description: 'its only kinda broken', price: 2000, image: 'http://i.imgur.com/3YljSmE.jpg', categories: Category.all.sample(5)},
                     {title: 'crate', description: 'put some stuff in them', price: 1279, image: 'http://i.imgur.com/oZyFzT2.jpg', categories: Category.all.sample(5)}])

content = Content.create([
       {name: "Butter",
        payload: "Aliquam feugiat, dui quis iaculis maximus, massa felis tincidunt sem, a imperdiet leo elit vitae urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc iaculis, ante eu pellentesque lacinia, nisl eros lobortis turpis, ut iaculis nibh magna nec ligula. Sed rutrum pulvinar tortor eget cursus. Integer euismod, quam vitae commodo porttitor, ligula lectus accumsan eros, a pretium nunc lectus in odio. Vivamus pellentesque dui mattis augue aliquam pellentesque. Donec egestas dolor mi, a rhoncus ex tempus et. Curabitur ornare nisl a dapibus porta. Morbi ac bibendum lorem, id egestas nunc."
       },
       {name: "Margerine",
        payload: "Maecenas tincidunt, elit nec posuere ullamcorper, justo lectus hendrerit purus, ac venenatis enim ligula eu felis. Nulla facilisi. Integer blandit nibh massa, nec commodo felis venenatis ac. Etiam semper porttitor leo sed sollicitudin. Nulla sed tortor massa. Morbi at orci neque. Curabitur semper sodales pulvinar. Donec luctus pharetra dolor, non porttitor sem facilisis sit amet. Aenean eu lectus purus. Vestibulum luctus at urna id euismod. Donec nulla enim, malesuada ac fermentum in, bibendum sed libero. Proin mattis nec ipsum a condimentum. Nulla eu placerat neque. Sed ac ornare lectus. Phasellus tempor nisi sit amet sem maximus, ullamcorper finibus dolor euismod. Phasellus posuere et ex vel sodales."
       },
        {name: "about-us",
        payload: "A charitable organization singly focused on providing individuals of all backgrounds what they need at a price they can afford, while allowing those who are so situated to give back."
       }

       ])
