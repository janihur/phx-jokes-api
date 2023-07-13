defmodule Jokes.Ipsum do
  def get_jokes(amount) do
    response = Req.get!("https://baconipsum.com/api/?type=meat-and-filler&paras=1") |> IO.inspect()
    case response.status do
      200 -> {200, %{"message" => response.body |> List.first(), "amount" => amount}}
        _ -> {500, %{"message" => "Something bad happened."}}
    end
  end
end
