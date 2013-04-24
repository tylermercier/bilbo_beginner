module WarriorAttribues

  LOW_HEALTH = 12
  FULL_HEALTH = 20
  FRIENDS = ['Captive']
  ENEMIES = ['Archer', 'Wizard', 'Sludge', 'Thick Sludge']
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
      return true if ENEMIES.include? thing.to_s
      return false if FRIENDS.include? thing.to_s
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

  def retreat?
    health_low? && taking_damage? && clear_behind?
  end

  def can_melee_enemy?
    @warrior.feel.enemy?
  end

  def can_range_enemy?
    can_see_enemy? && has_clear_shot?
  end

  def can_rescue_captive?
    @warrior.feel.captive?
  end

  def heal?
    damaged? && not_taking_damage?
  end

  def cannot_go_forward?
    @warrior.feel.wall?
  end
end
