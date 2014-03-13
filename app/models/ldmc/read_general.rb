module Ldmc
  class ReadGeneral
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'read general'

    field :read_ann, type: String

    field :lesion_dir, type: Array; LESION_OPT = ['periventriculares','sustancia blanca subcortical','sustancia gris','pedunculos cerebrales']
    field :level_dir
    field :level_flair

    embedded_in :subject

  end

end



