module Ldmc
  class Lesion
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'lesion'

    field :size_ax, type: Integer
    field :vertebral_level, type: Array; LEVEL_OPTS = ['C1','C2','C3','C4','C5','C6','C7','D1']
    field :clarity, type: String; CLARITY_OPTS = ['buena','regular','mala']
    field :spine_localization, type: Array; LOCAL_OPTS = ['Centromedular','Lateral','Anterior','Posterior']
    field :intensity_lesion, type: Float
    field :intensity_normalspine, type: Float
    field :intensity_nape, type: Float

    embedded_in :read_sequence
    
    before_validation do |model|
      model.vertebral_level.reject!(&:blank?) if model.vertebral_level
      model.spine_localization.reject!(&:blank?) if model.spine_localization
    end
    
    
    
    

  end
end
