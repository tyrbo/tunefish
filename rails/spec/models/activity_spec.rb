RSpec.describe Activity, :type => :model do
  it { should belong_to(:feed) }

  it 'should have a scope of act'
end
