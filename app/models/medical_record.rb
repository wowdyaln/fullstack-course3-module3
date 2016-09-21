class MedicalRecord
  include Mongoid::Document

  store_in collection: "medical"

  field :conditions, type: Array

  belongs_to :racer, dependent: :destory

  validates_presence_of :racer
end
