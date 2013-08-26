FactoryGirl.define do
  factory 'post/comment' do
    commenter { generate :string }
    body  { generate :string }
    # association :post, factory: :post
  end
end
