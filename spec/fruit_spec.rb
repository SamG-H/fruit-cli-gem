RSpec.describe Fruit do
  it "has a version number" do
    expect(Fruit::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
