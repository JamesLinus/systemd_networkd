#
# Cookbook Name:: systemd_networkd
# Recipe:: default
#
# Copyright 2014, Intel Corp
#
# All rights reserved - Do Not Redistribute
#

# include recipes if they are defined by the user attributes
if node.include?( "SystemdNetworkd" )
  if node[ "SystemdNetworkd" ].include?( "Cookbooks" )

    if node[ "SystemdNetworkd" ][ "Cookbooks" ].include?( "FDB" )
      if node[ "SystemdNetworkd" ][ "Cookbooks" ][ "FDB" ] == "true"
        include_recipe 'systemd_networkd_fdb'
      end
    end

    if node[ "SystemdNetworkd" ][ "Cookbooks" ].include?( "Link" )
      if node[ "SystemdNetworkd" ][ "Cookbooks" ][ "Link" ] == "true"
        include_recipe 'systemd_networkd_link'
      end
    end

    if node[ "SystemdNetworkd" ][ "Cookbooks" ].include?( "Switchport" )
      if node[ "SystemdNetworkd" ][ "Cookbooks" ][ "Switchport" ] == "true"
        include_recipe 'systemd_networkd_switchport'
      end
    end
  
    if node[ "SystemdNetworkd" ][ "Cookbooks" ].include?( "UFD" )
      if node[ "SystemdNetworkd" ][ "Cookbooks" ][ "UFD" ] == "true"
        include_recipe 'systemd_networkd_ufd'
      end
    end

    if node[ "SystemdNetworkd" ][ "Cookbooks" ].include?( "Team" )
      if node[ "SystemdNetworkd" ][ "Cookbooks" ][ "Team" ] == "true"
        include_recipe 'systemd_networkd_team'
      end
    end

  end
end
