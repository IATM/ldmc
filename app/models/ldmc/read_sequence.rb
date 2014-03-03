module Ldmc
  class ReadSequence
    include Mongoid::Document
    include Mongoid::Timestamps

    
    field :type, type: String, default: 'Read Sequence'
    field :sequence_name, type: Array; LESION_OPT = ['3D DIR','3D FLAIR','2D T1 FLAIR','2D DP', '2D STIR']
    field :sequence_ann, type: String

    embedded_in :visit

   
    
    
    #embeds_many :lessions, class_name: 'Ldmc::Lession'
  

    # Trim empty array values so they don't save to DB? UGGGLY pero funciona, until they fix this in Rails
    
  end

end
