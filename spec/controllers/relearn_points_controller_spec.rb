require 'rails_helper'

RSpec.describe RelearnPointsController, type: :controller do
  describe '四則演算' do
    it '1 + 1 は 2 になること' do
      expect(1 + 1).to eq 2
    end
    it '2 * 5　は10になることともうひとつ' do
      expect(2 * 5).to eq 10
      expect(3 % 3).to eq 0
    end
  end
end
