# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    display_title "MyString"
    headline "MyString"
    summary_short "MyText"
    suggested_link_text "MyString"
    suggested_link_text_url "MyString"
    image_url "MyString"
    opening_date "2014-10-02 16:04:31"
  end
end
