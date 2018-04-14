defmodule Ripper do
  alias Porcelain.Process, as: Proc

  @moduledoc """
    Ripper is a simple module to deal with TCP packets and http requests.
    By default, Ripper reads 1 packet.
    Simple usage is:


    ## Send request
        req = Ripper.request("8000")

    ## cURL and make a request and then read the output 

       result = req.read_pcap(req)
      .
  """

  defp get_rand do
    for _ <- 1..0x32 do
      Enum.random(0..0xF)
    end
    |> Enum.join()
  end

  defp get_file_path do
    Path.join("/tmp", "#{get_rand()}.pcap")
  end

  @doc """
    Checks if tcpdump process is alive or not
  """
  def status(proc) do
    proc |> Proc.alive?()
  end

  @doc """
    Stops the process
  """
  def stop(proc) do
    proc |> Proc.stop()
  end

  @doc """
    spawns a tcpdump process as root with given information

  """

  def request(port, packet_couent \\ 1, interface \\ :any) do
    outfile = get_file_path()

    cmd =
      "tcpdump -i #{interface} -nnvttttqSAU -s0 -c#{packet_couent} 'tcp port #{
        port
      } and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'"

    Porcelain.spawn_shell(cmd, out: {:append, outfile})
  end

  @doc """

    Reads output file of a given tcpdump process
  """

  def read_pcap(proc) do
    case proc |> status() do
      false ->
        {:append, f} = proc.out
        File.read(f)

      true ->
        {:error, :busy}
    end
  end
end
