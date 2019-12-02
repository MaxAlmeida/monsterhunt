require 'rails_helper'

RSpec.describe Death, :type => :model do
    let(:user) { FactoryBot.create(:user)}

    it "is valid with valid atrributes" do
      expect(user).to be_valid  
    end

    context 'when user dont was killed' do
        let(:user) { FactoryBot.create(:user)}
        it "expected to have 0 trophy " do
            expect(user.trophies.size).to eq(0)
        end
    end
    
   context 'when user was killed 1 time' do
        let!(:death) {FactoryBot.create(:death, user_id: user.id) }

        it "expected to get 1 trophy" do
            expect(user.trophies.size).to eq(1)
        end

        it "expected have trophy death category" do
            expect(user.trophies.last.level_score.category).to eq("Death")
        end
   end

   context 'when user was killed 10 times' do
    let!(:death) {FactoryBot.create_list(:death, 10,  user_id: user.id) }

        it "expected to get 2 trophy" do
            expect(user.trophies.size).to eq(2)
        end

        it "expected have trophy death category" do
            user.trophies.each do |trophy|
                expect(trophy.level_score.category).to eq("Death")
            end
        end
    end

    context 'when user was killed 25 times' do
        let!(:death) {FactoryBot.create_list(:death, 25,  user_id: user.id) }
    
        it "expected to get 3 trophy" do
            expect(user.trophies.size).to eq(3)
        end
    
        it "expected have trophy death category" do
            user.trophies.each do |trophy|
                expect(trophy.level_score.category).to eq("Death")
            end
        end
    end

    context 'when user was killed 50 times' do
        let!(:death) {FactoryBot.create_list(:death, 50,  user_id: user.id) }
    
        it "expected to get 4 trophy" do
            expect(user.trophies.size).to eq(4)
        end
    
        it "expected have trophy death category" do
            user.trophies.each do |trophy|
                expect(trophy.level_score.category).to eq("Death")
            end
        end
    end

    context 'when user was killed 100 times' do
        let!(:death) {FactoryBot.create_list(:death, 100,  user_id: user.id) }
    
        it "expected to get 5 trophy" do
            expect(user.trophies.size).to eq(5)
        end
    
        it "expected have trophy death category" do
            user.trophies.each do |trophy|
                expect(trophy.level_score.category).to eq("Death")
            end
        end
    end
end