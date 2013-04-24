require 'warrior_attributes'
class Player
  include WarriorAttribues

  attr_accessor :warrior, :last_health

  def initialize
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
    if health_low? && taking_damage? && clear_behind?
      @warrior.walk! :backward
    elsif @warrior.feel.enemy?
      @warrior.attack!
    elsif range_enemy_behind?
      @warrior.pivot!
    elsif can_see_enemy? && has_clear_shot?
      @warrior.shoot!
    elsif @warrior.feel.captive?
      @warrior.rescue!
    elsif damaged? && not_taking_damage?
      @warrior.rest!
    elsif @warrior.feel.wall?
      @warrior.pivot!
    else
      @warrior.walk!
    end
  end

  def end_turn
    @last_health = @warrior.health
  end
end
