# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Article.delete_all
Comment.delete_all
Tag.delete_all

5.times do |i|
  Category.create(name: "Category_#{i+1}")
end

category_id = Category.first.id

5.times do |i|
  text = [*1..9, *'A'..'Z', *'a'..'z'].sample(30).join
  Article.create(title: "Title_#{i+1}", text: text, category_id: category_id)
end

article_id = Article.first.id

5.times do |i|
  body = [*1..9, *'A'..'Z', *'a'..'z'].sample(15).join
  Comment.create(body: body, article_id: article_id)
end

5.times do |i|
  Tag.create(name: "Tag_#{i+1}", article_id: article_id)
end