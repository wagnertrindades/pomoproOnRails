require 'rails_helper'

RSpec.describe Timer, type: :model do
  let(:timer) { build_stubbed(:timer) }

  it { is_expected.to belong_to(:user) }

  it "validates inclusion of status" do
    expect validate_inclusion_of(:status).in_array(%w(pomo break long_break))
  end

  describe "#is_pomo?" do

    context "status equals pomo" do
      before { allow(timer).to receive(:status).and_return("pomo") }

      it { expect(timer.is_pomo?).to be_truthy }
    end

    context "status different pomo" do
      before { allow(timer).to receive(:status).and_return("oIkdk") }

      it { expect(timer.is_pomo?).to be_falsy }
    end
  end

  describe "#is_break?" do

    context "status equals break" do
      before { allow(timer).to receive(:status).and_return("break") }

      it { expect(timer.is_break?).to be_truthy }
    end

    context "status diffrent break" do
      before { allow(timer).to receive(:status).and_return("kjhKd") }

      it { expect(timer.is_break?).to be_falsy }
    end
  end

  describe "#is_long_break?" do

    context "status equals long break" do
      before { allow(timer).to receive(:status).and_return("long_break") }

      it { expect(timer.is_long_break?).to be_truthy }
    end

    context "status different long break" do
      before { allow(timer).to receive(:status).and_return("fkdHdj") }

      it { expect(timer.is_long_break?).to be_falsy }
    end
  end

end
