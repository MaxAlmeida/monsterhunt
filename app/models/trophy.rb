class Trophy < ApplicationRecord
  belongs_to :user
  belongs_to :level_point
end
