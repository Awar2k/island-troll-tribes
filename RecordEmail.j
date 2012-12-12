//! zinc

library RecordEmail requires ittEvent, TimerUtils, optional ArgsUtils {
	
	ittEvent emails;

	function CatchRegisterEmailMsg(ArgsList a) {
		emails[a.triggerPlayer] = a[0];
		a.destroy();
	}

	function onInit() {
		TimerStart(NewTimer(), 1, false, function() {
			ReleaseTimer(GetExpiredTimer());
			emails = ittEvent.create("email", TYPE_STRING);
			ChatCommands.registerArgFunc(null, "register", CatchRegisterEmailMsg);
		});

		TimerStart(NewTimer(), 240, false, function() {
			ReleaseTimer(GetExpiredTimer());
			DisplayTextToPlayer(GetLocalPlayer(), 0, 0, GENERAL_COLOR+"Use -register <your email> to regist your email with twgb");
			DisplayTextToPlayer(GetLocalPlayer(), 0, 0, GENERAL_COLOR+"to recieve info about arrange games and other TwGB news");
		});
	}

}

//! endzinc