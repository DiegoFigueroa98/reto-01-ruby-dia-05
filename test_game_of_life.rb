require 'minitest/autorun'
require './game_of_life'

class TestGame < Minitest::Test
  def setup
    @game = GameOfLife.new(10)
  end

  def test_initialize
    matrix = Array.new(10){Array.new(10)}
    assert_equal matrix, @game.board
    assert_equal matrix, @game.neighborhood
  end

  def test_create_board_randomly
    @game.create_board_randomly
    @game.board.each { |row| row.each { |elem| assert_match(/\_||1/, elem) } }
  end

  def test_next_state
    @game.create_board_randomly
    @game.neighborhood.each { |row| row.each { |elem| assert_equal 0, elem } }
    @game.next_state
    @game.neighborhood.each { |row| row.each { |elem| assert_match(/[0-9]/, elem.to_s) } }
  end
end 