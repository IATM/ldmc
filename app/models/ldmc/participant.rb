module Ldmc
  class Participant
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String, default: 'participant'
    field :user_id, type: String
    field :role, type: String; ROLE_OPTS = ['rad1', 'rad2', 'pi']
  end
end
