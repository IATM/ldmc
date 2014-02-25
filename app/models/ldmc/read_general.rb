module Ldmc
  class ReadGeneral
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'Read General'
    field :lesion_dir, type: Array; LESION_OPT = ['periventriculares','sustancia blanca subcortical','sustancia gris','pedunculos cerebrales']
    field :level_dir
    field :level_flair
    
    
    #embeds_many :lessions, class_name: 'Ldmc::Lession'
  

    # Trim empty array values so they don't save to DB? UGGGLY pero funciona, until they fix this in Rails
    
  end

end
