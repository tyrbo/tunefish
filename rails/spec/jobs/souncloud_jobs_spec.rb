require 'rails_helper'

describe SoundcloudAPIWorker do
  Sidekiq::Testing.fake!

  before { @user = User.create(soundcloud_user_id: '3171632') }

  it 'adds a job to the queue' do
    expect {
      SoundcloudAPIWorker.perform_async(@user)
    }.to change(SoundcloudAPIWorker.jobs, :size).by(1)
  end

  describe '.perform' do
    it 'creates new soundcloud activities' do
      VCR.use_cassette('soundcloud/tracks_from_jobs') do
        work = SoundcloudAPIWorker.new
        work.perform(@user.soundcloud_user_id, @user.id)
        expect(SoundcloudActivity.first.url).to be
        work.perform(@user.soundcloud_user_id, @user.id)
        expect(SoundcloudActivity.count).to be(1)
      end
    end
  end
end
