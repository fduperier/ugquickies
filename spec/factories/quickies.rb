FactoryGirl.define do
  factory :quickie, :class => 'Quickie' do
    title "MyString"
    description "MyText"
    user_group nil
    creator nil
  end

end
