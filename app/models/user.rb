class User < ApplicationRecord
    has_secure_password
    belongs_to :profileable, polymorphic: true, optional: true
    validates :username, presence: true, uniqueness: true

    def is_runner?
        self.profileable_type == 'Runner'
    end

    def is_brand?
        self.profileable_type == 'Brand'
    end

    def is_admin?
        self.profileable_type == 'Admin'
    end
end
