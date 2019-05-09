rule TrojanWin32ComfooSample
{
	meta:
		Description  = "Trojan.Comfoo.sm"
		ThreatLevel  = "5"

	strings:
		$ = "exclusiveinstance12" ascii wide
		$ = "MYGAMEHAVESTART" ascii wide
		$ = "MYGAMEHAVEstarted" ascii wide
		$ = "MYGAMEHAVESTARTEd" ascii wide
		$ = "MYGAMEHAVESTARTED" ascii wide
		$ = "thisisanewfirstrun" ascii wide
		$ = "THISISASUPERNEWGAMENOWBEGIN" ascii wide
		$ = "thisisnewtrofor024" ascii wide

		$ = "cabinet.dll" ascii wide
		$ = "09lkjds" ascii wide
		$ = "perfdi.ini" ascii wide
		$ = "msobj.sys" ascii wide
		$ = "usbak.sys" ascii wide
		$ = "\\\\.\\DevCtrlKrnl" ascii wide
		$ = "THIS324NEWGAME" ascii wide
		$ = "watchevent29021803" ascii wide
		$ = "iamwaitingforu653890" ascii wide
		$ = "Call to GetAdaptersInfo failed. Return Value" ascii wide
		$ = "Hard Disk(%s--LocalDisk)" ascii wide
		$ = "Total size: %I64d (MB)" ascii wide

		$ = "SYSTEM\\CurrentControlSet\\Services\\%s" ascii wide

		$hex0 = { 6a ff 68 1b 04 01 10 64 ?? ?? ?? ?? ?? 50 64 ?? ?? ?? ?? ?? ?? 51 56 57 68 30 17 00 00 e8 ?? ?? ?? ?? 83 c4 04 89 ?? ?? ?? 85 c0 c7 ?? ?? ?? ?? ?? ?? ?? 74 ?? 8b c8 e8 ?? ?? ?? ?? 8b f0 eb ?? 33 f6 8b ?? 6a 01 8b ce c7 ?? ?? ?? ?? ?? ?? ?? ff ?? ?? bf 30 3b 01 10 83 c9 ff 33 c0 8b ?? f2 ?? f7 d1 49 51 68 30 3b 01 10 8b ce ff ?? ?? 8b ?? 68 81 3e 00 00 8b ce ff ?? ?? 8b ?? ?? ?? 8b ?? 50 8b ce ff ?? ?? 8b ?? ?? ?? 8b ?? 50 8b ce ff ?? ?? 56 e8 ?? ?? ?? ?? 8b f8 83 c4 04 f7 df 1b ff 47 85 f6 74 ?? 8b ce e8 ?? ?? ?? ?? 56 e8 ?? ?? ?? ?? 83 c4 04 8b ?? ?? ?? 8b c7 5f 5e 64 ?? ?? ?? ?? ?? ?? 83 c4 10 c3}
		$hex1 = { 55 56 57 6a 08 33 ed e8 ?? ?? ?? ?? 8b f0 83 c4 04 85 f6 0f ?? ?? ?? ?? ?? ff ?? ?? ?? ?? ?? 89 ?? ff ?? ?? ?? ?? ?? 50 ff ?? ?? ?? ?? ?? 68 7f 03 0f 00 55 68 94 32 01 10 89 ?? ?? ff ?? ?? ?? ?? ?? 8b f8 85 ff 74 ?? 53 57 ff ?? ?? ?? ?? ?? 85 c0 74 ?? 68 ff 01 0f 00 55 55 68 e8 30 01 10 ff ?? ?? ?? ?? ?? 8b d8 85 db 74 ?? 53 ff ?? ?? ?? ?? ?? 85 c0 74 ?? bd 01 00 00 00 53 ff ?? ?? ?? ?? ?? 57 ff ?? ?? ?? ?? ?? 85 ed 5b 74 ?? 8b c6 5f 5e 5d c3}
		$hex2 = { 53 53 6a 03 53 53 68 00 00 00 c0 68 78 33 01 10 ff ?? ?? ?? ?? ?? 89 ?? ?? 83 f8 ff 75 ?? 33 c0 8b ?? ?? 64 ?? ?? ?? ?? ?? ?? 5f 5e 5b 8b e5 5d c3 89 ?? ?? 89 ?? ?? 89 ?? ?? be 88 33 01 10 8b c7 8a ?? 8a ca 3a ?? 75 ?? 3a cb 74 ?? 8a ?? ?? 8a ca 3a ?? ?? 75 ?? 83 c0 02 83 c6 02 3a cb 75 ?? 33 c0 eb ?? 1b c0 83 d8 ff 3b c3 75 ?? 89 ?? ?? eb ?? 57 ff ?? ?? ?? ?? ?? 89 ?? ?? 83 f8 ff 74 ?? 8b ?? ?? 50 ff ?? ?? ?? ?? ?? 66 ?? ?? ?? 53 8d ?? ?? 51 6a 04 8d ?? ?? 52 6a 06 8d ?? ?? 50 8b ?? ?? 56 8b ?? ?? 51 ff ?? ?? ?? ?? ?? 85 c0 74 ?? 81 fe c8 20 22 00 75 ?? c7 ?? ?? ?? ?? ?? ?? c7 ?? ?? ?? ?? ?? ?? e8 ?? ?? ?? ?? 8b ?? ?? 8b ?? ?? 64 ?? ?? ?? ?? ?? ?? 5f 5e 5b 8b e5 5d c3}

	condition:
		(3 of them) or (any of ($hex*))
}