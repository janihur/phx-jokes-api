defmodule JokesWeb.JokesController do
  alias JokesWeb.JokesException
  use JokesWeb, :controller

  def index(conn, _params) do
    try do
      amount = case conn.query_params do
        %{"amount" => amount} ->
          case to_integer(amount) do
            {:ok, integer} -> integer
            {:error, message} -> raise(JokesException, status: 400, message: message)
          end
        _ -> 1
      end

      {status, response} = case conn.query_params do
        %{"family" => family } ->
          case family do
            "chucknorris" -> chucknorris(amount)
            "ipsum"       -> ipsum(amount)
            "simpsons"    -> simpsons(amount)
            _             -> {400, %{"message" => "Unknown family: '#{family}'"}}
          end
        _ -> {400, %{"message" => "Missing family"}}
      end
      conn
      |> put_status(status)
      |> json(response)
    catch
      :error, error_type ->
        conn
        |> put_status(error_type.status)
        |> json(%{"message" => error_type.message})
    end
  end

  def chucknorris(amount) do
    {200, %{"message" => "Hello, Chuck Norris!", "amount" => amount}}
  end

  def ipsum(amount) do
    {200, %{"message" => "Hello, Ipsum!", "amount" => amount}}
  end

  def simpsons(amount) do
    {200, %{"message" => "Hello, Simpsons!", "amount" => amount}}
  end

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
