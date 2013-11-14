require 'factory_girl'

FactoryGirl.define do
  factory :group_1, :class => Group do
    name 'Group 1'
  end

  factory :group_2, :class => Group do
    name 'Group 2'
  end
end
