include ActionDispatch::TestProcess
FactoryBot.define do
  factory :directory do
    name { "MyString" }
    directory { nil }
    trait :with_file do
      files do 
       Array.new(1) { fixture_file_upload 'spec/fixtures/test_file.txt'}
      end
    end
  end
end
