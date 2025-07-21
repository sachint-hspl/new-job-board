class Role < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :users, through: :user_roles

    validates :name, presence: true, uniqueness: true
    before_validation :upcase_name

    private

    def upcase_name
        self.name = name.upcase if name.present?
    end
end
