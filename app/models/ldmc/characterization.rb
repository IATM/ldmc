class Characterization
  include Mongoid::Document
  include Mongoid::Timestamps
  
 
  field :sequence_name, type: Array; NAME_OPTS = ['3D DIR','3D FLAIR','2D T1 FLAIR','2D DP','2D STIR']
  
  embeds_many :lessions

  embedded_in :read_ldmc

end
