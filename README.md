systemd_networkd Cookbook
=========================
This master cookbook is responsible for configuring primary settings of systemd-networkd and loading child cookbooks.

Requirements
------------
- `systemd` - systemd_networkd required systemd > 216

Attributes
----------

All keys are case sensitive.  CamelCase is used instead of underscore.
Cooks should not the use of SystemdNetwork namepace over systemd_networkd.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['SystemdNetworkd']['Cookbooks']</tt></td>
    <td>Associative Array</td>
    <td>Child cookbooks to load</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----

Just include `systemd_networkd` in your node's `run_list`:

```json
{                                                                                                        
  "name": "IES",                                                                                          
  "description": "Default role",                                                                         
  "run_list": [
    "recipe[systemd_networkd]"
  ],
  "default_attributes": {                         
    "SystemdNetworkd": {                          
      "Cookbooks": {                              
        "FDB": "true",                            
        "Link": "true",                           
        "Switchport": "true",                     
        "UFD": "true",                            
        "Team": "true"                            
      }
   }
}
```

Contributing
------------
Not yet defined

License and Authors
-------------------
Authors: Intel
