class Item < ApplicationRecord
  belongs_to :inventory
  belongs_to :creator, class_name: "User", optional: true
end
