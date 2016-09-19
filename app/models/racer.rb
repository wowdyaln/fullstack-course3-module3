class Racer
  include Mongoid::Document

  store_in collection: "racer1"

  field :dob, as: :date_of_birth, type: Date
  field :gender, type: String
  field :fn, as: :first_name, type: String
  field :ln, as: :last_name, type: String
end
