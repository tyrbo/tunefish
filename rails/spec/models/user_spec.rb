require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'should create user from omniauth hash' do
    hash = {'info' => {'first_name' => 'Jon'}}
    user = User.create_from_hash!(hash)
    expect(user.name).to eq('Jon')
  end

  it { should have_many(:identities) }

  it 'should have all youtube subscriptions' do
    user = User.create(name: "Jon Snow", email: "jsnow@whitewall.gov")
    json = {
     "items" => [
      {
       "snippet" => {
        "publishedAt" => "2014-10-30T15:39:14.000Z",
        "title" => "VICE",
        "description" => "VICE specializes in exploring uncomfortable truths and going to places we don't belong. Herein you will find people talking frankly about their hatred and love for various things, general heresy, the only culture, travel and news documentaries you'll want to watch, tons of exclusive new stuff, and probably not a lot of cats. You're welcome.",
        "resourceId" => {
         "kind" => "youtube#channel",
         "channelId" => "UCn8zNIfYAQNdrFRrr8oibKw"
        },
        "channelId" => "UC_R3-VJlFnDhlG_9hk-tZiQ",
        "thumbnails" => {
         "default" => {
          "url" => "https://yt3.ggpht.com/-SuohYAOTZvs/AAAAAAAAAAI/AAAAAAAAAAA/JHg2bUQ0Gjc/s88-c-k-no/photo.jpg"
         },
         "high" => {
          "url" => "https://yt3.ggpht.com/-SuohYAOTZvs/AAAAAAAAAAI/AAAAAAAAAAA/JHg2bUQ0Gjc/s240-c-k-no/photo.jpg"
         }
        }
       }
      }]}
    expect(user.subscriptions(json)).to be_an_instance_of Hash
    expect(user.subscriptions(json)).to eq({"VICE" => "UCn8zNIfYAQNdrFRrr8oibKw"})
  end
end
