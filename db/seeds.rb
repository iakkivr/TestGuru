10.times do
  user_name = Faker::Name.name #for users
  User.create name: user_name
end

['Ruby', 'HTML', 'Frontend', 'Backend'].each do |title_category|
  Category.create title: title_category
end

10.times do
  title_test = Faker::Job.title
  level = (1..5).to_a.sample
  category_id = (1..4).to_a.sample
  author_id = (1..10).to_a.sample
  Test.create title: title_test, level: level, category_id: category_id, author_id: author_id
end



20.times do
  question_body = Faker::Hipster.sentences.sample
  test_id = (1..4).to_a.sample
  Question.create body: question_body, test_id: test_id
end

20.times do
  answer_body = Faker::Science.science
  correct = [false, true].sample
  question_id = (1..20).to_a.sample
  Answer.create body: answer_body, correct: correct, question_id: question_id
end
# answer_body = Faker::Science.science # for answers
# category_title = ['Ruby', 'HTML', 'Frontend', 'Backend'] #for category
# question_body  = Faker::Hipster.sentences.sample #for questions
