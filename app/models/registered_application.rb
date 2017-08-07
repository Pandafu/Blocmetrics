class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events


  validates :user, presence: true
  validates :url, uniqueness: true
end
