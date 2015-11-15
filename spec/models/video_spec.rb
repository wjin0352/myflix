require 'spec_helper'

describe Video do

  # it 'saves itself' do
  #   video = Video.new(title: 'monk', description: 'show about a crazy detective', cover_image_url: '/tmp/monk.jpg')
  #   video.save
  #   expect(Video.first).to eq(video)
  # end

  # it 'belongs to category' do
  #   comedy = Category.create(name: 'comedy')
  #   family_guy = Video.create(title: 'family guy', description: 'Story of peter griffin', cover_image_url: '/tmp/family_guy.jpg', category: comedy)
  #   expect(family_guy.category).to eq(comedy)
  # end

  # it 'is invalid without title' do
  #   video = Video.create(title: nil, description: 'Story of peter griffin')
  #   expect(video).not_to be_valid
  # end

  # it 'is invalid without description' do
  #   video = Video.create(title: 'family guy', description: nil)
  #   expect(video).not_to be_valid
  # end

  it { should have_db_column :title }
  it { should have_db_column :description }
  it { should have_db_column :cover_image_url }
  it { should have_db_column :small_cover_url }
  it { should have_db_column :large_cover_url }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :cover_image_url }

  it { should belong_to :category }

end
