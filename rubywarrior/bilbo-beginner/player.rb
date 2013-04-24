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
    end_turn
  end

  def inspect_world
    p "Health: #{@warrior.health}"
    p "Last Health: #{@last_health}"
    p "View: #{@warrior.look}"
  end

  def take_action
    if retreat?
      @warrior.walk! :backward
    elsif can_melee_enemy?
      @warrior.attack!
    elsif range_enemy_behind?
      @warrior.pivot!
    elsif can_range_enemy?
      @warrior.shoot!
    elsif can_rescue_captive?
      @warrior.rescue!
    elsif heal?
      @warrior.rest!
    elsif cannot_go_forward?
      @warrior.pivot!
    else
      @warrior.walk!
    end
  end

  def end_turn
    @last_health = @warrior.health
  end
end
