class Team < ActiveRecord::Base
  has_many :picks
  # has_many :draftees
  # has_many :actuals
  # has_many :seconds
  has_many :mypicks
  belongs_to :draftee
  belongs_to :second

  validates :name, :presence => true
  validates :city, :presence => true

  has_attached_file :helmet, styles: { medium: "300x300>", thumb: "100x100>", xs: "25x25" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :helmet, content_type: /\Aimage\/.*\z/
end
