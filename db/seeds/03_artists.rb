progressbar = ProgressBar.create(
  title: 'Creating Artist'
)

5.times do |u|
  user = User.create(email: "artist#{u + 1}@gmail.com", password: '123456', user_type: 'artist')
  user.gallery.update(name: Faker::Artist.name, gallery_type: 'public_gallery', domain: 'https://www.thearticit.com', welcome_video: 'https://youtu.be/LxqIN5r0c_0',
                      views: Faker::Number.between(from: 1, to: 5000))
  user.profile.update(first_name: Faker::Name.first_name, surname: Faker::Name.last_name, company_name: "ABC#{u * u}", phone_number: '+441632960630',
                      bio: 'Unapologetic pop culture specialist. Social mediaholic. Incurable web fanatic. Tv trailblazer. Zombie nerd. Twitter fan.', social_account: { 'facebook' => 'https://facebook.com', 'linkedin' => 'https://linkedin.com', 'instagram' => 'https://insta.com' })
                      
  progressbar.increment
end
