require_relative './warrior_attributes'

class Player
  include WarriorAttribues

  attr_accessor :warrior, :last_health

  def initialize(warrior=nil)
    @warrior = warrior
    @last_health = 20
  end

  def play_turn(warrior)
    @warrior = warrior

    inspect_world
    lookup_action.call
    update_state
  end

  def inspect_world
    p "Health: #{@warrior.health}"
    p "Front: #{@warrior.look}"
    p "Back: #{@warrior.look(:backward)}"
  end

  def lookup_action
    return lambda { @warrior.walk! :backward } if retreat?
    return lambda { @warrior.attack! } if melee_attack_enemy?
    return lambda { @warrior.pivot! } if range_enemy_behind?
    return lambda { @warrior.shoot! } if range_attack_enemy?
    return lambda { @warrior.rescue! } if rescue_captive?
    return lambda { @warrior.rest! } if heal?
    return lambda { @warrior.pivot! } if something_behind?
    return lambda { @warrior.pivot! } if cannot_go_forward?
    lambda { @warrior.walk! }
  end

  def update_state
    @last_health = @warrior.health
  end
end
