module Ldmc
  class ReadSequence
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'read sequence'

    field :sequence_name, type: String; SEQ_OPT = ['3D DIR','3D FLAIR','2D T1 FLAIR','2D DP', '2D STIR']
    field :sequence_ann, type: String
    field :nolesion_tri, type: Boolean
    field :updated_by

    embedded_in :subject
    embeds_many :lesions, class_name: 'Ldmc::Lesion'

    accepts_nested_attributes_for :lesions, :reject_if => :all_blank, :allow_destroy => true
   

  end

end
