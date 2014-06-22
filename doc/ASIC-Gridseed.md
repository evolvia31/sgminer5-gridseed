# sgminer Gridseed GC3355 Support

## Compilation, Configuration and command-line options

### Compilation

Use: `--enable-gridseed` to compile with gridseed support

Example: `./configure --enable-gridseed`

### Configuration

GC3355-specific options can be specified via `--gridseed-options` or `gridseed-options` in the configuration file as a comma-separated list of sub-options:

* baud - miner baud rate (default 115200);
* freq - see below list of freq;
* pll_r, pll_f, pll_od - fine-grained frequency tuning; see below;
* chips - number of chips per device (default 5 or 40) maximum set is 256;
* per_chip_stats - print per-chip nonce generations and hardware failures;

If pll_r/pll_f/pll_od are specified, freq is ignored, and calculated as follows:

* Fin = 25
* Fref = int(Fin / (pll_r + 1))
* Fvco = int(Fref * (pll_f + 1))
* Fout = int(Fvco / (1 << pll_od))
* freq = Fout

This version of cgminer turns off all BTC cores so that power usage is low. On a 5-chip USB miner, power usage is around 10 W.

To the command line:

You can also specified options via `--gridseed-freq` to specify only freq or `--gridseed-chips` to specify only chips number by panel.

To the configuration file:

You can also specified options via `gridseed-freq:` to specify only freq or `gridseed-chips:` to specify only chips number per device.

### Frequency list

* Frequency available:

700,  706,  713,  719,  725,  731,  738,  744,
750,  756,  763,  769,  775,  781,  788,  794,
800,  813,  825,  838,  850,  863,  875,  888,
900,  913,  925,  938,  950,  963,  975,  988,
1000, 1013, 1025, 1038, 1050, 1063, 1075, 1088,
1100, 1113, 1125, 1138, 1150, 1163, 1175, 1188,
1200, 1213, 1225, 1238, 1250, 1263, 1275, 1288,
1300, 1313, 1325, 1338, 1350, 1363, 1375, 1388,
1400

Optimal frequency is between 800 and 850.

800 to normal mode, 838 or more to overclock mode.

### Example command line

./sgminer --gridseed-freq=800 --gridseed-chips=40 --gridseed-options=baud=115200 -o http://pool:port -u username -p password


