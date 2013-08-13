class SwitchCable < ActiveRecord::Base
  attr_accessible :color, :from_device, :from_port, :mode, :protocal, :to_device, :to_port, :type, :vlan, :switch_id
  belongs_to :switch
end
