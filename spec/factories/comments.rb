FactoryBot.define do
  factory :comment do
    content { "MyText" }
    article { :article }
  end
end
