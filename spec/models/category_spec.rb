require 'spec_helper'

describe Category do

  it 'saves itself' do
    category = Category.new(name: 'comedy')
    category.save
    expect(Category.first).to eq(category)
  end

  it 'has many videos' do
    comedy = Category.create(name: 'comedy')
    south_park = Video.create(title: 'south park', description: 'Cartoon comedy about a group of friends', cover_image_url: '/tmp/south_park.jpg', category: comedy)
    futurama = Video.create(title: 'futurama', description: 'show about the future', category: comedy)
    expect(comedy.videos).to eq([futurama, south_park])
  end

end
