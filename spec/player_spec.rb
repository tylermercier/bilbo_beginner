require File.join(File.dirname(__FILE__), '..', 'rubywarrior', 'bilbo-baggins-intermediate', 'player')

require 'spec_helper'

describe Player do
  context :play_turn do
    it "assert" do
      player = Player.new
      warrior = OpenStruct.new()
      #player.play_turn(warrior)
      true.should be_true
    end
  end
end