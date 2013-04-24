module WarriorAttribues

  LOW_HEALTH = 12
  FULL_HEALTH = 20

  FRIENDS = ['Captive']
  ENEMIES = ['Sludge', 'Thick Sludge', 'Archer', 'Wizard']

  def can_feel?
    defined? @warrior.feel
  end

  def can_look?
    defined? @warrior.look
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

  def can_see_enemy
    @warrior.look.each do |thing|
      return true if ENEMIES.include? thing.to_s
    end
    false
  end

  def has_clear_shot
    @warrior.look.each do |thing|
      return true if ENEMIES.include? thing.to_s
      return false if FRIENDS.include? thing.to_s
    end
    false
  end
end
