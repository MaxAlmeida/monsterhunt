require 'rails_helper'

RSpec.describe CollectedCoin, :type => :model do
    before(:all) do
      @user = FactoryBot.create(:user) 
    end

    it "is valid with valid atrributes" do
      expect(@user).to be_valid  
    end

    it "user dont collect coin , expected to gain 0 trophy " do
      user = FactoryBot.create(:user)
      expect(user.trophies.size).to eq(0)
    end

    it "user collect 9 coins expected to gain 1 trophy" do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:collected_coin, 9, user_id: user.id)
      expect(user.trophies.size).to eq(1)
    end

    it "User collect 1 coin expected to gain 1 trophy" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:collected_coin, user_id: user.id)
      expect(user.trophies.size).to eq(1)
    end

    it "user collect 10 coins expected to gain 2 trophy" do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:collected_coin, 10, user_id: user.id)
      expect(user.trophies.size).to eq(2)
    end


    it "user collect 100 coins expected to gain 3 trophy" do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:collected_coin, 100, user_id: user.id)
      expect(user.trophies.size).to eq(3)
    end

    it "user collect 10000 coins expected to gain 4 trophy" do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:collected_coin, 500, user_id: user.id)
      expect(user.trophies.size).to eq(4)
    end

    it "user collect 100000 coins expected to gain 5 trophy" do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:collected_coin, 1000, user_id: user.id)
      expect(user.trophies.size).to eq(5)
    end

end
