module Ldmc
  class ReadLdmc
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'Read Ldmc'
    field :lesion_dir, type: Array; LESION_OPT = ['periventriculares','sustancia blanca subcortical','sustancia gris','pedunculos cerebrales']
    field :level_dir
    field :level_flair
   

    embedded_in :visit

  end
end

