class ServiceOrder < ApplicationRecord
  belongs_to :user
  belongs_to :device
end
