module Ldmc
class Lession
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: String, default: 'Lessions'
  field :no_lesion
  field :vertebral_level, type: Array; LEVEL_OPTS = ['C1','C2','C3','C4','C5','C6','C7','D1']
  field :clarity, type: String; CLARITY_OPTS = ['buena','regular','mala']
  field :spine_localization, type: Array; LOCAL_OPTS = ['Centromedular','Lateral','Anterior','Posterior']
  field :intensity_lesion
  field :intensity_normalspine
  field :intensity_nape

  embedded_in :visit

end
end