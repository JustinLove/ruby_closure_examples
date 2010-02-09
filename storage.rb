$players = ["Fred", "Barney"]
$phases = [
  lambda {|player|
    p "#{player} recovers"},
  lambda {|player|
    p "#{player} chooses"},
  lambda {|player|
    p "#{player} acts"} ]

$phases.each {|phase|
  $players.each {|player|
    phase.call(player)
  }
}
