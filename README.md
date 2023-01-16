# FPCTorLauncher
Tor lancher for FPC apps.

```
var
  tor: TTorLauncher;
  port_onion: word = 9151;
  port_socks: word = 9152;
  bin_dir: string = ''; // folder with tor exe file or empty
  work_dir: string  = 'tor_files_dir';
  bridge1: string  = '';
  bridge2: string  = '';
  bridge3: string  = '';
  output : string = '';
  my_onion_adress = '';
...
tor := TTorLauncher.Create(bin_dir, tor_files_dir,
    port_onion, port_socks, TTorBridges.Create(bridge1, bridge2, bridge3));

repeat
    output := tor.GetNewOutput;
    Write(output);
    Sleep(1000);
until tor.ready or tor.error;
if tor.error then exit;
my_onion_adress := tor.host;
// you turn
tor.free;
```
