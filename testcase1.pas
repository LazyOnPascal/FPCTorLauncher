unit TestCase1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry;

const
  DEFAULT_BRIDGE_1 = '';
  DEFAULT_BRIDGE_2 = '';
  CONNECTION_TIMEOUT = 100;

type

  TTorTest= class(TTestCase)
  published
    procedure TorConnect;
  end;

implementation

uses
  TorLauncher;

procedure TTorTest.TorConnect;
var
  tor: TTorLauncher;
  vTimer: byte;
begin
  tor := TTorLauncher.Create('', 'TorWorkDir',
    9151, 9152, TTorBridges.Create(DEFAULT_BRIDGE_1, DEFAULT_BRIDGE_2, ''));
  try
    tor.process.Execute;
    for vTimer := 0 to CONNECTION_TIMEOUT do
    begin
      Write(tor.GetNewOutput);
      Sleep(1000);
      if tor.ready or tor.error then break;
    end;
    AssertTrue('Tor not connected!', tor.ready);
  finally
    tor.Free;
  end;
end;



initialization

  RegisterTest(TTorTest);
end.

