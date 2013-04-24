class Player
  attr_accessor :direction

  # :forward, :backward, :left or :right
  def play_turn(warrior)
    dat_feels(warrior)

    if warrior.feel.enemy?
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

  def dat_feels(warrior)
    p warrior.feel(:forward).inspect
    p warrior.feel(:backward).inspect
    p warrior.feel(:left).inspect
    p warrior.feel(:right).inspect
  end
end
