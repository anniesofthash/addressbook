require 'factory_girl'

FactoryGirl.define do
  factory :chicago, :class => Address do
    address1 '123 Main St.'
    address2 'Apt. 109'
    city 'Chicago'
    state 'IL'
    zip '60606'
    association :address_type, factory: :individual
    home_phone '312-555-1234'
  end

  factory :alsip, :class => Address do
    address1 '456 Maple Ave.'
    city 'Alsip'
    state 'IL'
    zip '60803'
    association :address_type, factory: :individual
    home_phone '708-111-2222'
  end

  factory :tinley_park, :class => Address do
    address1 '789 Oakland Pl.'
    city 'Tinley Park'
    state 'IL'
    association :address_type, factory: :individual
    zip '60477'
  end

  factory :phone_only, :class => Address do
    association :address_type, factory: :individual
    home_phone '708-111-3333'
  end
end
