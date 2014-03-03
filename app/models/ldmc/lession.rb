module Ldmc
class Lession
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: String, default: 'Lessions'
  field :no_lesion, type: Integer
  field :size_ax, type: Integer
  field :vertebral_level, type: Array; LEVEL_OPTS = ['C1','C2','C3','C4','C5','C6','C7','D1']
  field :clarity, type: String; CLARITY_OPTS = ['buena','regular','mala']
  field :spine_localization, type: Array; LOCAL_OPTS = ['Centromedular','Lateral','Anterior','Posterior']
  field :intensity_lesion, type: Float
  field :intensity_normalspine, type: Float
  field :intensity_nape, type: Float

  #embedded_in :read_sequence
  embedded_in :visit

end
end