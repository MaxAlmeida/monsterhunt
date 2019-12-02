FactoryBot.define do

    factory :user, class: 'User' do
        name {"Usertest"}
        password {"test"}
    end

    factory :collected_coin, class: 'CollectedCoin' do
        value {10}
    end

    factory :death, class: 'Death' do
        user
        user_id {:user.id}
    end

    factory :killed_monster, class: 'KilledMonster' do
        user
    end
end