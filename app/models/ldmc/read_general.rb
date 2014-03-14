module Ldmc
  class ReadGeneral
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'read general'
    field :indication, type: String
    field :read_ann, type: String
    field :lesion_dir, type: Array; LESION_OPT = ['periventriculares','sustancia blanca subcortical','sustancia gris','pedunculos cerebrales']
    field :level_dir, type: String
    field :level_flair, type: String

    embedded_in :subject

  end

end



