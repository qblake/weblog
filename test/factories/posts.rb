FactoryGirl.define do
  factory :post do
    title { generate :string }
    text  { generate :string }
    after(:build) do |c|
      c.publish
    end
  end
end
