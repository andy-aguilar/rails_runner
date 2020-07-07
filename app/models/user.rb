class User < ApplicationRecord
    belongs_to :profileable, polymorphic: true, optional: true
    # accepts_nested_attributes_for :profileable
end
