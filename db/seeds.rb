# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
netflix = Network.create!({
                name: 'Netflix',
                established: '1997-01-01 11:00:00',
                num_of_shows: 2
            })
bojack_horseman = Show.create!({
                name: 'Bojack Horseman',
                daytime_show: true,
                num_of_seasons: 6,
                network_id: netflix.id
            })

cannon_busters = Show.create!({
                name: 'Cannon Busters',
                daytime_show: true,
                num_of_seasons: 1,
                network_id: netflix.id
            })
cartoon_network = Network.create!({
                name: 'Cartoon Network',
                established: '1992-10-01 11:00:00',
                num_of_shows: 1
            })
ricky_and_morty = Show.create!({
                name: 'Rick and Morty',
                daytime_show: true,
                num_of_seasons: 4,
                network_id: cartoon_network.id
            })