class Switch < ActiveRecord::Base
  attr_accessible :admin_ip, :num_ports, :rack, :switch_name
  has_many :switch_cables, :dependent => :destroy
end
