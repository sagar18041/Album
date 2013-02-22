class Folder < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :pictures,:dependent=>:destroy
  belongs_to :user
  validates :name, :presence => true
end
