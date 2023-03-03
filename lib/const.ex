defmodule Const do
  @moduledoc """
  ```elixir
  defmodule TopBlogs do
    use Const

    defk BEST_BLOG, "https://mitchellhanberg.com"

    def the_best?() do
      IO.puts ~k"BEST_BLOG"
    end
  end
  ```
  """
  defmacro __using__(_) do
    quote do
      import Const
    end
  end

  defmacro defk({:__aliases__, [line: 4], [constant]}, value) do
    func_name = {:"k#{constant}", [], nil}

    quote do
      def unquote(func_name) do
        unquote(value)
      end
    end
  end

  defmacro sigil_k({:<<>>, _, [bin]}, _mods) do
    {:"k#{bin}", [], []}
  end
end
