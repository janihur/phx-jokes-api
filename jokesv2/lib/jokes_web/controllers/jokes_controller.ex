defmodule JokesWeb.JokesController do
  alias JokesWeb.JokesException
  use JokesWeb, :controller

  def index(conn, _params) do
    try do
      amount = case conn.query_params do
        %{"amount" => amount} ->
          case Jokes.Util.to_integer(amount) do
            {:ok, integer} -> integer
            {:error, message} -> raise(JokesException, status: 400, message: message)
          end
        _ -> 1
      end

      {status, response} = case conn.query_params do
        %{"family" => family } ->
          case family do
            "chucknorris" -> Jokes.ChuckNorris.get_jokes(amount)
            "ipsum"       -> Jokes.Ipsum.get_jokes(amount)
            "simpsons"    -> Jokes.Simpsons.get_jokes(amount)
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
end
