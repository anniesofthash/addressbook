require 'factory_girl'

FactoryGirl.define do
  factory :individual, :class => AddressType do
    description 'Individual'
  end

  factory :family, :class => AddressType do
    description 'Family'
  end
  factory :married_couple, :class => AddressType do
    description 'Married Couple'
  end
  factory :unmarried_couple, :class => AddressType do
    description 'Unmarried Couple'
  end
  factory :single_parent, :class => AddressType do
    description 'Single Parent'
  end
end
