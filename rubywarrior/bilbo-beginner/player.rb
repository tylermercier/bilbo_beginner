require 'warrior_attributes'
class Player
  include WarriorAttribues

  attr_accessor :warrior, :last_health

  DIRECTIONS = [:forward, :left, :backward, :right]

  def initialize
    @last_health = 20
    @retreated = false
  end

  def play_turn(warrior)
    @warrior = warrior

    inspect_world
    take_action
    end_turn
  end

  def inspect_world
    p "Last Health: #{@last_health}"
    p "Health: #{@warrior.health}"
  end

  def take_action
    if can_feel? && @warrior.feel.enemy?
      @warrior.attack!
    elsif health_low && not_taking_damage
      @warrior.rest!
    else
      @warrior.walk!
    end
  end

  def end_turn
    if has_health?
      @last_health = @warrior.health
    end
  end
end
