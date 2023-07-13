defmodule Jokes.Util do
  def to_integer(candidate) do
    case Integer.parse(candidate) do
      {integer, remainder} ->
        case blank?(remainder) do
          true -> {:ok, integer}
          _    -> {:error, "Not a valid integer: '#{candidate}'"}
        end
      _ -> {:error, "Not a valid integer: '#{candidate}'"}
    end
  end

  # https://stackoverflow.com/a/52491465/272735
  def blank?(str_or_nil), do: "" == str_or_nil |> to_string() |> String.trim()
end
