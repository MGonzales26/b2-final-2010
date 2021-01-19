require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "Relationship" do
    it {should have_many :participants}
    it {should have_many(:teams).through(:participants)}
  end
end
