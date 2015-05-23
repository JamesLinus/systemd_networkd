if node.attribute?( "ONPPlatform" )
  if node[ "ONPPlatform" ] == "fm10ks"

	default[ "SystemdNetworkdSwitchport" ][ "L2HashKeySupported" ] = \
	        %w( SmacMask DmacMask EthertypeMask VlanId1Mask VlanPri1Mask \
		SymmetrizeMac UseL3Hash UseL2IfIp )

	default[ "SystemdNetworkdSwitchport" ][ "L3HashConfigSupported" ] = \
        	%w( SipMask DipMask L4SrcMask L4DstMask DscpMask IslUserMask \
        	ProtocolMask FlowMask SymmetrizeL3Fields EcmpRotation Protocol1 \
		Protocol2 UseTcp UseUdp UseProtocol1 UseProtocol2 )

	default[ "SystemdNetworkdSwitchport" ][ "CpuSupportedAttributes" ] = \
		%w( LagMode )

	default[ "SystemdNetworkdSwitchport" ][ "CpuQosSupportedAttributes" ] = \
		%w( AutoPauseMode DscpSwpriMap )

	default[ "SystemdNetworkdSwitchport" ][ "CpuRateLimitSupported" ] = \
		%w( BcastRate BcastCapacity McastRate McastCapacity CpuMacRate \
		CpuMacCapacity IgmpRate IgmpCapacity IcmpRate IcmpCapacity \
		ReservedMacRate ReservedMacCapacity MtuViolRate MtuViolCapacity )

  else

	default[ "SystemdNetworkdSwitchport" ][ "L2HashKeySupported" ] = []
	default[ "SystemdNetworkdSwitchport" ][ "L3HashConfigSupported" ] = []
	default[ "SystemdNetworkdSwitchport" ][ "CpuSupportedAttributes" ] = []
	default[ "SystemdNetworkdSwitchport" ][ "CpuQosSupportedAttributes" ] = []
	default[ "SystemdNetworkdSwitchport" ][ "CpuRateLimitSupported" ] = []

  end
end
