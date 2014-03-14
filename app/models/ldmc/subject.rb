module Ldmc
  class Subject
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'subject'
    field :identification, type: String
    field :sex, type: String
    field :birthdate, type: Date

    embeds_many :read_sequences, class_name: 'Ldmc::ReadSequence'
    embeds_one :read_general, class_name: 'Ldmc::ReadGeneral'

    accepts_nested_attributes_for :read_sequences, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :read_general, :reject_if => :all_blank, :allow_destroy => true

    validates_presence_of :identification

  end
end
