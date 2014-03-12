class Subject
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  field :type, type: String, default: 'subject'
  field :identification, type: String
  field :sex, type: String
  field :birthdate, type: Date

  slug :identification

  embeds_many :read_sequences
  embeds_one :read_general

  validates_presence_of :identification

end
