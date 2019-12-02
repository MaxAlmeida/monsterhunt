require 'rails_helper'

RSpec.describe KilledMonster, :type => :model do
    let(:user) { FactoryBot.create(:user)}
    let(:turtle) {Monster.where(name: 'Turtle')[0]}
    let(:bowser) {Monster.where(name: 'Bowser')[0]}

    it "is valid with valid atrributes" do
        expect(user).to be_valid  
     end

    context 'When user kill each monster 1 time' do
        it "user kill turtle only" do
            FactoryBot.create(:killed_monster,user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(0)
        end
        it "user kill bowser only" do
            FactoryBot.create(:killed_monster,user_id: user.id, monster_id: bowser.id)
            expect(user.trophies.count).to eq(0)
        end

        it "user kill boths" do
            FactoryBot.create(:killed_monster,user_id: user.id, monster_id: bowser.id)
            FactoryBot.create(:killed_monster,user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(1)
        end
    end

    context 'When user kill each monster 10 times' do
        it "user kill turtle only" do
            FactoryBot.create_list(:killed_monster, 10, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(0)
        end
        it "user kill bowser only" do
            FactoryBot.create_list(:killed_monster, 10, user_id: user.id, monster_id: bowser.id)
            expect(user.trophies.count).to eq(0)
        end

        it "user kill boths" do
            FactoryBot.create_list(:killed_monster, 10, user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster, 10, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(2)
        end
    end

    context 'When user kill each monster 100 times' do
        it "user kill turtle only" do
            FactoryBot.create_list(:killed_monster, 100, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(0)
        end
        it "user kill bowser only" do
            FactoryBot.create_list(:killed_monster, 100, user_id: user.id, monster_id: bowser.id)
            expect(user.trophies.count).to eq(0)
        end

        it "user kill boths" do
            FactoryBot.create_list(:killed_monster, 100, user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster, 100, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(3)
        end
    end

    context 'When user kill each monster 500 times' do
        it "user kill turtle only" do
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(0)
        end
        it "user kill bowser only" do
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: bowser.id)
            expect(user.trophies.count).to eq(0)
        end

        it "user kill boths" do
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(4)
        end
    end

    context 'When user kill each monster 500 times' do
        it "user kill turtle only" do
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(0)
        end
        it "user kill bowser only" do
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: bowser.id)
            expect(user.trophies.count).to eq(0)
        end

        it "user kill boths" do
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster, 500, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(4)
        end
    end

    context 'When user kill each monster 1000 times' do
        it "user kill turtle only" do
            FactoryBot.create_list(:killed_monster, 1000, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(0)
        end
        it "user kill bowser only" do
            FactoryBot.create_list(:killed_monster, 1000, user_id: user.id, monster_id: bowser.id)
            expect(user.trophies.count).to eq(0)
        end

        it "user kill boths" do
            FactoryBot.create_list(:killed_monster, 1000, user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster, 1000, user_id: user.id, monster_id: turtle.id)
            expect(user.trophies.count).to eq(5)
        end
    end
    
end