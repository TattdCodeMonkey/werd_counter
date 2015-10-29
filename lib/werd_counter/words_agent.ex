defmodule WerdCounter.WordsAgent do

  defp name, do: __MODULE__

  def start_link, do: Agent.start_link(fn -> HashDict.new end, name: name())

  def get, do: Agent.get(name(), &(&1))

  def increment_word(word) do
    Agent.update(
      name,
      fn val ->
        Dict.update(val, word, 1, &(&1 + 1))
      end
    )
  end

  def clear_words do
    Agent.update(name, fn _ -> HashDict.new end)
  end
end
