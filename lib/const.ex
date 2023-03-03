defmodule Const do
  @moduledoc """
  ```elixir
  defmodule TopBlogs do
    use Const

    defk BEST_BLOG, "https://mitchellhanberg.com"

    def the_best?() do
      ~k"BEST_BLOG"TopBlogs
    end
  end

  defmodule TopBlogs.Blogs do
    use Const

    def list do
      ~k"BEST_BLOG"TopBlogs
    end
  end
  ```
  """
  defmacro __using__(_) do
    quote do
      import Const
    end
  end

  defmacro defk({:__aliases__, _, [constant]}, value) do
    func_name = {:"__k#{constant}__", [], nil}

    quote do
      @doc false
      def unquote(func_name) do
        unquote(value)
      end
    end
  end

  defmacro sigil_k({:<<>>, _, [bin]}, mods) do
    func = :"__k#{bin}__"

    if Enum.any?(mods) do
      {{:., [],
        [{:__aliases__, [alias: false], [String.to_existing_atom(to_string(mods))]}, func]}, [],
       []}
    else
      {func, [], []}
    end
  end
end
