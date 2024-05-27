namespace :db do
  desc "Generate articles"
  task generate_articles: :environment do
    40.times do |i|
      Article.create(
        title: "Article #{i+1}",
        content: "This is the content of article #{i+1}",
      )
    end
    puts "Successfully create Articles"
  end
end
