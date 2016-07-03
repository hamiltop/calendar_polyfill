defmodule CalendarPolyfill do
  if !Code.ensure_loaded?(Calendar) do
    @doc ~S"""
    Handles the sigil `~D` for dates.

    The lower case `~d` variant does not exist as interpolation
    and escape characters are not useful for date sigils.

    ## Examples
        
        iex> import CalendarPolyfill
        iex> ~D[2015-01-13]
        ~D[2015-01-13]
    """
    defmacro sigil_D(date, modifiers)
    defmacro sigil_D({:<<>>, _, [string]}, []) do
      Macro.escape(Date.from_iso8601!(string))
    end

   @doc ~S"""
    Handles the sigil `~T` for times.

    The lower case `~t` variant does not exist as interpolation
    and escape characters are not useful for time sigils.

    ## Examples

        iex> ~T[13:00:07]
        ~T[13:00:07]
        iex> ~T[13:00:07.001]
        ~T[13:00:07.001]

    """
    defmacro sigil_T(date, modifiers)
    defmacro sigil_T({:<<>>, _, [string]}, []) do
      Macro.escape(Time.from_iso8601!(string))
    end

    @doc ~S"""
    Handles the sigil `~N` for naive date times.

    The lower case `~n` variant does not exist as interpolation
    and escape characters are not useful for datetime sigils.

    ## Examples

        iex> ~N[2015-01-13 13:00:07]
        ~N[2015-01-13 13:00:07]
        iex> ~N[2015-01-13T13:00:07.001]
        ~N[2015-01-13 13:00:07.001]

    """
    defmacro sigil_N(date, modifiers)
    defmacro sigil_N({:<<>>, _, [string]}, []) do
      Macro.escape(NaiveDateTime.from_iso8601!(string))
    end
    def translate_time_unit(unit) do
      case unit do
        :microseconds -> :micro_seconds
        _ -> unit
      end
    end
  end
end
