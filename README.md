# Const

Adds constants to Elixir!

```elixir
defmodule TopBlogs do
  use Const

  defk BEST_BLOG, "https://mitchellhanberg.com"

  def the_best?() do
    IO.puts ~k"BEST_BLOG"
  end
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `const` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:const, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/const>.
