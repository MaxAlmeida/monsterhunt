require 'rails_helper'

RSpec.describe User, :type => :model do
    let(:user) { FactoryBot.create(:user)}
    let(:turtle) {Monster.where(name: 'Turtle')[0]}
    let(:bowser) {Monster.where(name: 'Bowser')[0]}

    context "when user dont score" do
        it { expect(user.scored_categories).to be_empty}
    end

    context "when user collect 1 coin" do
        it "user collect 1 coin" do
            FactoryBot.create(:collected_coin, user_id: user.id)
            expect(user.scored_categories).to match_array(["CollectedCoin"])
        end

        it "user collect 100 coins " do
            FactoryBot.create_list(:collected_coin, 100, user_id: user.id)
            expect(user.scored_categories).to match_array(["CollectedCoin"])
        end
    end

    context "when user kills monster" do
        it "user kill 1 each type " do
            FactoryBot.create(:killed_monster,user_id: user.id, monster_id: bowser.id)
            FactoryBot.create(:killed_monster,user_id: user.id, monster_id: turtle.id)
            expect(user.scored_categories).to match_array (["KilledMonster"])
        end

        it "user kill 10 each type " do
            FactoryBot.create_list(:killed_monster,10,user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster,10,user_id: user.id, monster_id: turtle.id)
            expect(user.scored_categories).to match_array (["KilledMonster"])
        end
    end

    context "when user dies" do
        it "user dies 1 time " do
            FactoryBot.create(:death, user_id: user.id)
            expect(user.scored_categories).to match_array (["Death"])
        end
        
        it "user dies 10 times " do
            FactoryBot.create_list(:death,10,user_id: user.id)
            expect(user.scored_categories).to match_array (["Death"])
        end
    end

    context "User collect coin, dies and kills monster" do
        it "show all scored categories" do
            FactoryBot.create_list(:death,10,user_id: user.id)
            FactoryBot.create_list(:killed_monster,10,user_id: user.id, monster_id: bowser.id)
            FactoryBot.create_list(:killed_monster,10,user_id: user.id, monster_id: turtle.id)
            FactoryBot.create_list(:collected_coin, 100, user_id: user.id)
            expect(user.scored_categories).to match_array (["Death", "KilledMonster", "CollectedCoin"])
        end
    end
end
