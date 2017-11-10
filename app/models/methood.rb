class Methood < ApplicationRecord
  validates :link, presence: true, uniqueness: true
  has_many :selections, dependent: :destroy
  has_many :experiences, through: :selections

  def self.methodologies
    methods = MethodUpdater::MethodUpdater.methodologies
    methods.each do |method|
      new_method = Methood.find_or_create_by(link: method[:url])
      new_method.update(name: method[:name]) if new_method.name.blank?
    end
    Methood.all
  rescue Net::ReadTimeout, Net::OpenTimeout, Net::HTTP::Persistent::Error
    Methood.all
  end
end
