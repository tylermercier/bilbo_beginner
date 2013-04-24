module WarriorAttribues

  CRITICAL_HEALTH = 14

  def can_feel?
    defined? @warrior.feel
  end

  def has_health?
    defined? @warrior.health
  end

  def health_low
    @warrior.health < CRITICAL_HEALTH
  end

  def not_taking_damage
    @warrior.health >= @last_health
  end
end
