class Team < ActiveRecord::Base
  has_many :picks
  has_many :draftees
  has_many :actuals
  has_many :seconds
  has_many :mypicks

  has_attached_file :helmet, styles: { medium: "300x300>", thumb: "100x100>", xs: "25x25" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :helmet, content_type: /\Aimage\/.*\z/
end
