if node.attribute?( "ONPPlatform" )
  if node[ "ONPPlatform" ] == "fm10ks"

	default[ "SystemdNetworkd" ][ "PortId" ] = [*1..27].map {|s| "sw0p#{s}" }

	default[ "SystemdNetworkdSwitchport" ][ "SupportedAttributes" ] = \
		%w( Autoneg AutonegBasepage AutonegLinkInhbTimer \
		AutonegLinkInhbTimerKx BcastFlooding BcastPruning DefCfi \
		DefDscp DefPri DefPri2 DefSwpri DefVlan DefVlan2 \
		Dot1xState DropBv DropTagged DropUntagged EeeMode \
		EeeTxActivityTimeout EeeTxLpiTimeout EyeScore \
		FabricLoopback IgnoreIfgErrors Learning Loopback \
		MacTableAddressAgingTime MaxFrameSize McastFlooding \
		McastPruning ParseMpls Parser ParserStoreMpls \
		ParserVlan1Tag ParserVlan2Tag PauseMode ReplaceDscp \
		RoutedFrameUpdateFields RxClassPause RxCutThrough \
		RxPriorityMap SecurityAction SwpriDscpPref SwpriSource \
		TimestampGeneration TxCutThrough UcastFlooding \
		UcastPruning UpdateDscp UpdateTtl )

        default[ "SystemdNetworkdSwitchport" ][ "QosSupportedAttributes" ] = \
                %w( AutoPauseMode DscpSwpriMap GlobalUsage PrivWm SharedPriWm \
                SharedSoftDropWm SharedSoftDropWmHog SharedSoftDropWmJitter \
                SharedUsage SwpriTcMap TcSmpMap TrapClassSwpriMap VpriSwpriMap \
                TcEnable PrivatePauseOnWm PrivatePauseOffWm SharedPauseOffWm \
                SharedPauseOnWm SharedPauseEnable TcPcMap PcRxmpMap L2Vpri1Map \
                RxPriorityMap TxPriorityMap SchedGroupPrisetNum SchedGroups \
                SchedGroupWeight SchedPriSets SchedGroupStrict ShapingGroupMaxRate \
                ShapingGroupMinRate ShapingGroupMaxBurst CirRate CirAction \
                CirCapacity ColorSource EirAction EirCapacity EirRate \
                DscpMkdnMap SwpriMkdnMap MkdnDscp MkdnSwpri DelPolicer )

  else

	default[ "SystemdNetworkd" ][ "PortId" ] = 0
	default[ "SystemdNetworkdSwitchport" ][ "SupportedAttributes" ] = []
        default[ "SystemdNetworkdSwitchport" ][ "QosSupportedAttributes" ] = []

  end
end
