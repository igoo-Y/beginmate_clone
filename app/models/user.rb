class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile

  enum status: ["no_status", "job_searching", "job_offering", "in_office"], _suffix: true
  enum region: ["seoul", "busan", "incheon", "gwangju"], _suffix: true
  enum role: ["etc", "planner", "designer", "developer"], _suffix: true

  acts_as_taggable_on :details

  has_many :teams, dependent: :destroy
end
