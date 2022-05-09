class Order < ApplicationRecord
  validate_presence_of :reference
  validate :reference, length: { maximum: 32 }
end
