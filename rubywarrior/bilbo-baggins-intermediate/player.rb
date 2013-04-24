class Player
  attr_accessor :direction, :binding

  # :forward, :backward, :left or :right
  def play_turn(warrior)
    dat_feels(warrior)

    if enemy_count(warrior) > 1 && @binding.nil?
      @binding = true
      warrior.bind!(:left)
    elsif enemy_count(warrior) > 1
      warrior.bind!(:backward)
    elsif enemy_count(warrior) > 0
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      move(warrior)
    end
  end

  def move(warrior)
    if warrior.feel.wall? || !@direction.nil?
      turn(warrior)
    else
      warrior.walk!
    end
  end

  def turn(warrior)
    if !@direction.nil?|| warrior.feel(:right).wall?
      @direction = :backward
      warrior.walk! :backward
    else
      warrior.walk! :right
    end
  end

  def enemy_count(warrior)
    enemy_count = 0

    enemy_count += 1 if warrior.feel(:forward).enemy?
    enemy_count += 1 if warrior.feel(:backward).enemy?
    enemy_count += 1 if warrior.feel(:left).enemy?
    enemy_count += 1 if warrior.feel(:right).enemy?

    p enemy_count

    enemy_count
  end

  def dat_feels(warrior)
    p warrior.feel(:forward).inspect
    p warrior.feel(:backward).inspect
    p warrior.feel(:left).inspect
    p warrior.feel(:right).inspect
  end
end
