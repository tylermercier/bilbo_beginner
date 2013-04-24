require File.join(File.dirname(__FILE__), '..', 'rubywarrior', 'bilbo-beginner', 'player')

require 'spec_helper'

describe Player do
  before(:each) do
    @warrior = {}
  end

  let(:player) { Player.new(@warrior) }

  context :health_low? do
    it "returns true when health below 12" do
      @warrior.stub(:health).and_return(11)
      player.health_low?.should be_true
    end
  end

  context :damaged? do
    it "returns true when health below 20" do
      @warrior.stub(:health).and_return(11)
      player.damaged?.should be_true
    end
  end

  context :taking_damage? do
    it "returns true when health less than last health" do
      @warrior.stub(:health).and_return(11)
      player.last_health = 12
      player.taking_damage?.should be_true
    end
  end

  context :not_taking_damage? do
    it "returns true when health greater than or equal to last health" do
      @warrior.stub(:health).and_return(12)
      player.last_health = 12
      player.not_taking_damage?.should be_true
    end
  end

  context :can_see_enemy? do
    it "returns true when enemy spotted" do
      @warrior.stub(:look).and_return(['nothing', 'nothing', 'Archer'])
      player.can_see_enemy?.should be_true
    end
  end

  context :has_clear_shot? do
    it "returns true when no friendlies in the way" do
      @warrior.stub(:look).and_return(['nothing', 'nothing', 'Archer'])
      player.has_clear_shot?.should be_true
    end

    it "returns false when friendlies in the way" do
      @warrior.stub(:look).and_return(['nothing', 'Captive', 'Archer'])
      player.has_clear_shot?.should be_false
    end
  end

  context :range_enemy_behind? do
    it "returns true when range enemy spotted" do
      @warrior.stub(:look).with(:backward).and_return(['nothing', 'nothing', 'Archer'])
      player.range_enemy_behind?.should be_true
    end

    it "returns false when no range enemy spotted" do
      @warrior.stub(:look).with(:backward).and_return(['nothing', 'nothing', 'Sludge'])
      player.range_enemy_behind?.should be_false
    end
  end

  context :clear_behind? do
    it "returns true when no obstruction" do
      @warrior.stub(:look).with(:backward).and_return(['nothing', 'nothing', 'nothing'])
      player.clear_behind?.should be_true
    end

    it "returns false when obstruction" do
      @warrior.stub(:look).with(:backward).and_return(['nothing', 'nothing', 'Sludge'])
      player.clear_behind?.should be_false
    end
  end

  context :retreat? do
    it "returns true when ..." do
      false.should be_true
    end
  end

  context :melee_attack_enemy? do
    it "returns true when ..." do
      false.should be_true
    end
  end

  context :range_attack_enemy? do
    it "returns true when ..." do
      false.should be_true
    end
  end

  context :rescue_captive? do
    it "returns true when ..." do
      false.should be_true
    end
  end

  context :heal? do
    it "returns true when ..." do
      false.should be_true
    end
  end

  context :cannot_go_forward? do
    it "returns true when ..." do
      false.should be_true
    end
  end
end
