defmodule Jokes.ChuckNorris do
  def get_jokes(amount) do
    response = Req.get!("https://api.chucknorris.io/jokes/random") |> IO.inspect()
    case response.status do
      200 -> {200, %{"message" => response.body["value"], "amount" => amount}}
        _ -> {500, %{"message" => "Something bad happened."}}
    end
  end
end
