require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe "Relationship" do
    it { should belong_to :competition}
    it { should belong_to :team}
  end
end
