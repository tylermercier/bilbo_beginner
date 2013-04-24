require 'warrior_attributes'

class Player
  include WarriorAttribues

  attr_accessor :warrior, :last_health

  DIRECTIONS = [:forward, :left, :backward, :right]
  CRITICAL_HEALTH = 8

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
    p "Health: #{@warrior.health}"
  end

  def take_action
    if can_feel? && warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health < CRITICAL_HEALTH
      warrior.rest!
    else
      warrior.walk!
    end
  end

  def end_turn
    if has_health?
      @last_health = warrior.health
    end
  end
end
