require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "Relationship" do
    it { should have_many :players }
    it { should have_many :participants }
    it { should have_many(:competitions).through(:participants) }
  end
end
