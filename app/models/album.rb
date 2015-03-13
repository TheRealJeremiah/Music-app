# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  live       :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :band_id, :name, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
