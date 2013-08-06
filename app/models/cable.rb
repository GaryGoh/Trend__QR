class Cable < ActiveRecord::Base
  attr_accessible :color, :from_nic, :server_id, :to_end, :to_nic
  belongs_to :server
end
