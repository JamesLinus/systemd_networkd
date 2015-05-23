systemd_networkd Cookbook
=========================
This cookbook is responsible for configuring systemd-networkd.
A modified version of systemd networkd is required.

This can be found @ https://github.com/proxykillah/systemd

Requirements
------------
- `systemd` - systemd_networkd required systemd > 216

Attributes
----------

All keys are case sensitive.  CamelCase is used instead of underscore.

Recipes
-------

- default: sets up directories and deletes old configurations
- cpuport: configures attributes specific to cpu port
- link: configures port state and port speed
- static_mac_table: confgures the static MAC table (FDB)
- switchport: configures port attributes
- team: configures LAGs and LAG-specific features (e.g. LAG attributes)
- ufd: configures uplink failure detection

Usage
-----

Just include `systemd_networkd` in your node's `run_list`:
Below is a fully working example of the relevant configuration options.


```json
{                                                                                                        
  "name": "IES",                                                                                          
  "description": "Default role",                                                                         
  "run_list": [
    "recipe[systemd_networkd]"
  ],
  "default_attributes": {                         
    "SystemdNetworkd": {
      "Backup": false,
      "Teams": {
        "team1": {
          "Enabled": true,
          "Members": [
            "sw0p9",
            "sw0p10"
          ],
          "Attributes": {
            "DefVlan": "1"
          },
          "Vlans": {
            "lab": {
              "Id": "20",
              "EgressUntagged": "true"
            },
            "office": {
              "Id": "25"
            }
          }
        }
      },
      "UFD": {
        "sw0p1": {
          "Enabled": true,
          "BindCarrier": "sw0p2 sw0p3"
        },
        "sw0p5": {
          "Enabled": true,
          "BindCarrier": "sw0p6 sw0p7 sw0p8 sw0p9"
        }
      },
      "Ports": {
        "sw0p0": {
          "Attributes": {
            "LagMode": "1"
          },
          "L2HashKey": {
            "UseL3Hash": "1"
          },
          "L3HashConfig": {
            "UseTcp": "1"
          }
        },
        "sw0p4": {
          "Enabled": true,
          "FDB": [
            [
              "MACAddress",
              "AB:BC:CC:00:01:02",
              "VLANId",
              "2"
            ],
            [
              "MACAddress",
              "AB:BC:CC:00:01:02",
              "VLANId",
              "2"
            ],
            [
              "MACAddress",
              "AB:BC:CC:00:01:02",
              "VLANId",
              "3"
            ]
          ],
          "Attributes": [
            [
              "Autoneg",
              "1"
            ]
          ]
        },
        "sw0p5": {
          "Enabled": "false",
          "FDB": [
            [
              "MACAddress",
              "AB:BC:CC:00:01:02",
              "VLANId",
              "2"
            ],
            [
              "MACAddress",
              "AB:BC:CC:00:01:03",
              "VLANId",
              "2"
            ],
            [
              "MACAddress",
              "AB:BC:CC:00:01:03",
              "VLANId",
              "3"
            ]
          ],
          "Link": {
            "Link": [
              [
                "Duplex",
                "full"
              ],
              [
                "BitsPerSecond",
                "10240000"
              ]
            ]
          }
        },
        "sw0p6": {
          "Enabled": true,
          "FDB": [
            [
              "MACAddress",
              "AB:BC:CC:00:01:01",
              "VLANId",
              "2"
            ],
            [
              "MACAddress",
              "AB:BC:CC:00:01:01",
              "VLANId",
              "2"
            ],
            [
              "MACAddress",
              "AB:BC:CC:00:01:01",
              "VLANId",
              "3"
            ]
          ],
          "Vlans": {
            "lab": {
              "Id": "20",
              "EgressUntagged": "true"
            },
            "office": {
              "Id": "25"
            }
          }
        }
      }
    }
  }
}
```

License and Authors
-------------------
Authors: 
- David O Neill (david.m.oneill@intel.com)
- Kim-marie Jones (kim-marie.jones@intel.com)
