require 'factory_girl'

FactoryGirl.define do
  factory :john_doe, :class=> Contact do
    prefix 'Mr.'
    first_name 'John'
    middle_name 'Michael'
    last_name 'Doe'
    birthday '19780101'
    work_phone '873-837-3833'
    cell_phone '234-345-6521'
    email 'john.doe@doe.com'
    website 'http://www.johndoe.com'
  end

  factory :jane_doe, :class => Contact do
    prefix 'Mrs.'
    first_name 'Jane'
    middle_name 'Michelle'
    last_name 'Doe'
    birthday '19780102'
    work_phone '873-837-1111'
    email 'jane.doe@doe.com'
  end

  factory :jimmy_doe, :class => Contact do
    prefix 'Mr.'
    first_name 'Jimmy'
    middle_name 'Mikey'
    last_name 'Doe'
    birthday '20000103'
  end

  factory :billy_bob, :class => Contact do
    prefix 'Mr.'
    first_name 'Billy'
    last_name 'Bob'
  end
end
