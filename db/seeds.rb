User.destroy_all
Event.destroy_all
Review.destroy_all
Categorie.destroy_all
EventCategories.destroy_all

#Users data
10.times do 
    User.create(username: Faker::Name.unique.first_name, password_digest: "foobar")
end
admin = User.create(username: "Princeton", password_digest: "foobar")

#categories data
categories = ["Sports", "Music", "Social", "Educational", "Networking", "Arts"]

#event data with category, ticket, and bookmark data
7.times do |n|
    category = Categorie.create!(name: categories[n+1])

    10.times do
    event = Event.create!(
        title: Faker::Hipster.sentence,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        image_url: "coming soon",
        date: Faker::Date.in_date_period,
        price: rand(5..250),
        tickets_remaining: rand(5..25),
        capacity: rand(5..250),
        city: Faker::Address.city,
        state: Faker::Address.state
    )
    event_categories = EventCategories.create!(
        event_id: event.id,
        categorie_id: category.id
    )

        10.times do |t|
            Ticket.create!(
                user_id: t+1,
                event_id: event.id
            )
            Bookmark.create!(
                user_id: t+1,
                event_id: event.id
            )
        end
    end
end

