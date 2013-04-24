module WarriorAttribues

  LOW_HEALTH = 12
  FULL_HEALTH = 20

  def can_feel?
    defined? @warrior.feel
  end

  def has_health?
    defined? @warrior.health
  end

  def health_low
    @warrior.health < LOW_HEALTH
  end

  def damaged?
    @warrior.health < FULL_HEALTH
  end

  def taking_damage
    @warrior.health < @last_health
  end

  def not_taking_damage
    !taking_damage
  end
end
