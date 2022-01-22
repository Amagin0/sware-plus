FactoryBot.define do

  factory :recepi_kinoko, class: 'Recepi' do
    customer_id { 1 }
    recepi_title { 'きのこの山' }
    recepi_image_id { 111111 }
    impressions_count { 0 }
    
  end

  factory :recepi_takenoko, class: 'Recepi' do
    customer_id { 1 }
    recepi_title { 'たけのこの里' }
    recepi_image_id { 2 }
    recepi_id { 2 }
  end

end