class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  default_scope { order(:created_at) }

  before_create -> { self.id = SecureRandom.uuid }
end
