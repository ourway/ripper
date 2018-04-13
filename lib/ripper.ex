defmodule Ripper do
  alias Porcelain.Process, as: Proc

  @moduledoc """
  Documentation for Ripper.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Ripper.hello
      :world

  """
  def hello do
    :world
  end

  def status(proc) do
    proc |> Proc.alive?()
  end

  def request(port, password, packet_couent \\ 1, interface \\ :any) do
    cmd =
      "echo #{password} | sudo -S tcpdump -i #{interface} -nnvttttqSAU -s0 -c#{packet_couent} 'tcp port #{
        port
      } and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'"

    Porcelain.spawn_shell(cmd, out: :stream)

  end
end
