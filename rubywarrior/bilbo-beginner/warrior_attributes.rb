module WarriorAttribues

  LOW_HEALTH = 12
  FULL_HEALTH = 20
  FRIENDLY = ['Captive']
  ENEMIES = ['Archer', 'Wizard', 'Sludge', 'Thick Sludge']
  RANGE_ENEMIES = ['Archer', 'Wizard', 'Thick Sludge']
  UNIMPORTANT = ['nothing', 'wall']
  DIRECTIONS = [:forward, :left, :backward, :right]

  def health_low?
    @warrior.health < LOW_HEALTH
  end

  def damaged?
    @warrior.health < FULL_HEALTH
  end

  def taking_damage?
    @warrior.health < @last_health
  end

  def not_taking_damage?
    !taking_damage?
  end

  def can_see_enemy?
    @warrior.look.each do |thing|
      return true if ENEMIES.include? thing.to_s
    end
    false
  end

  def has_clear_shot?
    @warrior.look.each do |thing|
      return true if RANGE_ENEMIES.include? thing.to_s
      return false if FRIENDLY.include? thing.to_s
    end
    false
  end

  def range_enemy_behind?
    @warrior.look(:backward).each do |thing|
      return true if thing.to_s == 'Archer'
    end
    false
  end

  def clear_behind?
    @warrior.look(:backward).each do |thing|
      return false if thing.to_s != 'nothing'
    end
    true
  end

  def something_behind?
    @warrior.look(:backward).each do |thing|
      return true unless UNIMPORTANT.include? thing.to_s
    end
    false
  end

  def enemy_ahead?
    @warrior.look.each do |thing|
      return true if ENEMIES.include? thing.to_s
    end
    false
  end

  def retreat?
    health_low? && taking_damage? && clear_behind?
  end

  def melee_attack_enemy?
    @warrior.feel.enemy?
  end

  def range_attack_enemy?
    can_see_enemy? && has_clear_shot?
  end

  def rescue_captive?
    @warrior.feel.captive?
  end

  def heal?
    damaged? && not_taking_damage? && enemy_ahead?
  end

  def cannot_go_forward?
    @warrior.feel.wall?
  end
end
