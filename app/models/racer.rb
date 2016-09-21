class Racer
  include Mongoid::Document
  field :fn, as: :first_name, type: String
  field :ln, as: :last_name, type: String
  field :dob, as: :date_of_birth, type: Date

  embeds_one :primary_address, class_name: "Address", as: :addressable
  has_one :medical_record

  validates_presence_of :first_name
  validates_presence_of :last_name

  # has_many :races, class_name: "Entrant"
    def races
      Contest.where(:"entrants.racer_id"=>self.id).map do |contest|
        contest.entrants.where(:racer_id=>self.id).first
      end
    end


end
