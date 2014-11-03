RSpec.describe Feed, :type => :model do
  it { should have_many(:activities) }
end
