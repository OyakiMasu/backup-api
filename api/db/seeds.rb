puts "Seeding data...."

# Users
5.times do
  User.create!(
    username: Faker::Internet.username,
    password_digest: Faker::Internet.password(min_length: 8),
    email: Faker::Internet.email,
    user_type: 0
  )
end

RedFlagRecord.create!(
    title: "Corrupt Karau" ,
    description: "Traffic officers taking bribes ",
    latitude: -20.044345 ,
    longitude: -150.674892 ,
    image_url: 'https://i0.wp.com/biznakenya.com/wp-content/uploads/2016/05/1153641.jpg?fit=768%2C576&ssl=1',
    user_id: User.pluck(:id).sample,
    status: 0
  )
  InterventionRecord.create!(
  title: "Lack of Social amenities" ,
  description: "Local hospital in bad shape",
  latitude: -44.044345 ,
  longitude: -101.674892 ,
  image_url: 'https://s.hdnux.com/photos/41/77/61/8911959/12/1200x0.jpg',
  user_id: User.pluck(:id).sample,
  status: 0
)
RedFlagRecord.create!(
    title: "Bribing of Health Inspector" ,
    description: "Despite several irregularities during Inspection the manager and Health inspector agreed to a compromise",
    latitude: -19.044345 ,
    longitude: -178.674892 ,
    image_url: 'https://media.istockphoto.com/id/670974060/photo/at-the-doctor.jpg?s=612x612&w=0&k=20&c=d26UyxnnAhaHxzcW9rQDkZehUmf6P27IjzoOELMBaMk=',
    user_id: User.pluck(:id).sample,
    status: 0
  )
  InterventionRecord.create!(
  title: "Stalled Stadium Construction" ,
  description: "Workers and equipment were only seen at the site for a month." ,
  latitude: -50.044345 ,
  longitude: -178.674892 ,
  image_url: 'https://www.kenyans.co.ke/files/styles/article_style/public/images/media/Kamariny%20stadium.jpg?itok=4whBnFtL',
  user_id: User.pluck(:id).sample,
  status: 0
)
RedFlagRecord.create!(
    title: "Corrupt Judicial system" ,
    description: "The judge in my case was spotted with the defendant outside courtroom." ,
    latitude: -30.044345 ,
    longitude: -108.674892 ,
    image_url: 'https://media.istockphoto.com/id/670974060/photo/at-the-doctor.jpg?s=612x612&w=0&k=20&c=d26UyxnnAhaHxzcW9rQDkZehUmf6P27IjzoOELMBaMk=',
    user_id: User.pluck(:id).sample,
    status: 0
  )
  InterventionRecord.create!(
  title: "Dilapidated Road Work" ,
  description: "Funds were allocated for the re-tarmacking of our village road which is in a sorry state still." ,
  latitude: -60.044345 ,
  longitude: -148.674892 ,
  image_url: 'https://www.roadex.org/wp-content/uploads/elearning/environmental/4/421a.jpg',
  user_id: User.pluck(:id).sample,
  status: 0
)
RedFlagRecord.create!(
    title: "Forceful Eviction" ,
    description: "A developer came with Equipment and Personell and demolished businesses" ,
    latitude: -30.044345 ,
    longitude: -108.674892 ,
    image_url: 'https://gdb.voanews.com/C1DCC61C-A18D-47E5-810A-DB414509157B_cx0_cy9_cw0_w1597_n_r1_st_s.jpg',
    user_id: User.pluck(:id).sample,
    status: 0
  )
  InterventionRecord.create!(
  title: "Banditry" ,
  description: "Heavy Clashes between two pastoralists communities that are heavily armed" ,
  latitude: -60.044345 ,
  longitude: -148.674892 ,
  image_url: 'https://www.aljazeera.com/wp-content/uploads/2016/12/20b77a41a394462b9a38f1e4c7883a81_18.jpeg?resize=770%2C513&quality=80',
  user_id: User.pluck(:id).sample,
  status: 0
)
RedFlagRecord.create!(
    title: "Embezzlement of funds" ,
    description: "Company CEO misappropriated customer pensions" ,
    latitude: -30.044345 ,
    longitude: -108.674892 ,
    image_url: 'https://pointofview.net/wp-content/uploads/2022/11/FTX-crash-1024x577.png',
    user_id: User.pluck(:id).sample,
    status: 0
  )

  InterventionRecord.create!(
  title: "Public Hazard" ,
  description: " Endangerment of  public safety and life",
  latitude: -60.044345 ,
  longitude: -148.674892 ,
  image_url: 'https://i0.wp.com/www.k24tv.co.ke/wp-content/uploads/2022/03/Building-in-Regen.jpg?w=730&ssl=1',
  user_id: User.pluck(:id).sample,
  status: 0
)

puts "Done seeding data"
