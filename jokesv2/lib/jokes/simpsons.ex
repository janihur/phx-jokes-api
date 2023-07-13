defmodule Jokes.Simpsons do
  def get_jokes(amount) do
    response = Req.get!("https://thesimpsonsquoteapi.glitch.me/quotes") |> IO.inspect()
    case response.status do
      200 -> {200, %{"message" => response.body |> List.first() |> Map.get("quote"), "amount" => amount}}
        _ -> {500, %{"message" => "Something bad happened."}}
    end
    # {200, %{"message" => "Hello, Simpsons!", "amount" => amount}}
  end
end
