class Business < ApplicationRecord
    validates_presence_of :name

    has_many :business_users, dependent: :destroy
    has_many :users, through: :business_users
    has_many :tasks,  dependent: :destroy

    belongs_to :owner,foreign_key: "owner_id", class_name: "User"
end
