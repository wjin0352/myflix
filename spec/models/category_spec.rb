require 'spec_helper'

describe Category do

  # it 'saves itself' do
  #   category = Category.new(name: 'comedy')
  #   category.save
  #   expect(Category.first).to eq(category)
  # end

  # it 'has many videos' do
  #   comedy = Category.create(name: 'comedy')
  #   south_park = Video.create(title: 'south park', description: 'Cartoon comedy about a group of friends', cover_image_url: '/tmp/south_park.jpg', category: comedy)
  #   futurama = Video.create(title: 'futurama', description: 'show about the future', category: comedy)
  #   expect(comedy.videos).to eq([futurama, south_park])

  it { should validate_presence_of :name }

  it { should have_db_column :name }

  it { should have_many :videos }

  describe "#recent_videos" do

    it 'returns the videos in reverse chronological order by created_at' do
      comedy = Category.create(name: 'comedy')
      south_park = Video.create(title: 'south park', description: 'Cartoon comedy about friends', cover_image_url: '/tmp/south_park.jpg', category: comedy, created_at: 1.day.ago)
      simpsons = Video.create(title: 'simpsons', description: 'show homer and family', cover_image_url: '/tmp/futurama.jpg', category: comedy)

      expect(Category.find_by(name: 'comedy').recent_videos).to eq([simpsons, south_park])
    end

    it 'returns most recent 6 videos from category' do
      comedy = Category.create(name: 'comedy')

      6.times { Video.create(title: 'futurama', description: 'space comedy', cover_image_url: '/tmp/futurama.jpg', category: comedy) }
      simpsons = Video.create(title: 'Simpsons', description: 'homer comedy', cover_image_url: '/tmp/futurama.jpg', category: comedy, created_at: 1.day.ago)

      expect(Category.find_by(:name => 'comedy').recent_videos).not_to include([simpsons])
    end

    it 'returns all videos in category if there are less than 6 videos' do
      comedy = Category.create(name: 'comedy')

      4.times { Video.create(title: 'futurama', description: 'space comedy', cover_image_url: '/tmp/futurama.jpg', category: comedy) }

      expect(Category.find_by(name: 'comedy').recent_videos.size).to eq(4)
    end

    it 'returns first 6 videos in category if there are more than 6 videos in category' do
      comedy = Category.create(name: 'comedy')

      6.times { Video.create(title: 'futurama', description: 'space comedy', cover_image_url: '/tmp/futurama.jpg', category: comedy) }
      simpsons = Video.create(title: 'Simpsons', description: 'homer comedy', cover_image_url: '/tmp/futurama.jpg', category: comedy, created_at: 1.day.ago)


      expect(Category.find_by(name: 'comedy').recent_videos.size).to eq(6)
    end

    it 'returns an empty array if category has no videos' do
      comedy = Category.create(name: 'comedy')

      expect(comedy.videos).to eq([])
    end

  end

end
