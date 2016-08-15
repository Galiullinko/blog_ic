class Post < ActiveRecord::Base
  has_many :comments, depent: :destroy
  belongs_to :user

  validates :text, :title, presence: true
end
