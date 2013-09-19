class ReferenceService

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def create_reference!
    game_ref = reference
    loop do
      unless Game.where(game_ref: game_ref).exists?
        game.game_ref = game_ref
        break
      end
    end
  end

  private

  def reference(separator = '-')
    number = rand(1..999)
    ref = ("A".."Z").to_a.shuffle().first(3).join('')
    "#{ref}#{separator}#{number}"
  end
end