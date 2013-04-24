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
    take_action
    update_state
  end

  def inspect_world
    p "Health: #{@warrior.health}"
    p "View: #{@warrior.look}"
  end

  def take_action
    if retreat?
      @warrior.walk! :backward
    elsif melee_attack_enemy?
      @warrior.attack!
    elsif range_enemy_behind?
      @warrior.pivot!
    elsif range_attack_enemy?
      @warrior.shoot!
    elsif rescue_captive?
      @warrior.rescue!
    elsif heal?
      @warrior.rest!
    elsif cannot_go_forward?
      @warrior.pivot!
    else
      @warrior.walk!
    end
  end

  def update_state
    @last_health = @warrior.health
  end
end
