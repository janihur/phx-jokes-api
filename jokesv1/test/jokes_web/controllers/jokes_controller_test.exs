defmodule JokesWeb.JokesControllerTest do
  use ExUnit.Case

  test "blank" do
    assert true == JokesWeb.JokesController.blank?(nil)
    assert true == JokesWeb.JokesController.blank?("")
    assert true == JokesWeb.JokesController.blank?("\n")
    assert true == JokesWeb.JokesController.blank?("\t")
    assert true == JokesWeb.JokesController.blank?(" ")
    assert false == JokesWeb.JokesController.blank?("x")
    assert false == JokesWeb.JokesController.blank?(" x")
    assert false == JokesWeb.JokesController.blank?("x ")
  end

  test "to_integer" do
    assert {:ok, 5} == JokesWeb.JokesController.to_integer("5")
    assert {:error, "Not a valid integer: ''"} == JokesWeb.JokesController.to_integer("")
    assert {:error, "Not a valid integer: 'x5'"} == JokesWeb.JokesController.to_integer("x5")
    assert {:error, "Not a valid integer: '5x'"} == JokesWeb.JokesController.to_integer("5x")
  end
end
