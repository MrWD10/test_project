class User < ApplicationRecord

has_many :business_users, dependent: :destroy
has_many :businesses, through: :business_users
has_many :owned_businesses, foreign_key: "owner_id", class_name: "Business"
has_many :tasks, through: :businesses


  enum userrole: { admin: 0, writingbroker: 1, support: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable , :validatable


      #   validates_presence_of :name


  def first_name
      self.name.split.first
  end
         
  def last_name
    self.name.split.last
         
  end

         
end
