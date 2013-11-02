--
-- Simple table of messages for internationalization
-- These follow the regular format- string format and won't be "unescaped".
--
return {
	GROUP_MUSIC = "Music",
	GROUP_RECORDINGS = "Recordings",
	GROUP_VIDEOS = "Videos",
	GROUP_SYSTEMS = "Systems",
	GROUP_SAVES = "Saves",
	GROUP_TOOLS = "Tools",
	HOVER_CLONE = "Clone: Attach a copy of the canvas\\n\\r to the mouse cursor",
	HOVER_FILTER = "Display Filters: click to activate / set group" ..
	"\\n\\rright-click specific filter to configure",
	HOVER_AFILTER = "Switch Audio Visualization",
	HOVER_PLAYPAUSE = "Pause / Play at normal speed",
	HOVER_FASTFWD = "Increase playback speed",
	HOVER_STATESAVE = "Save current target state",
	HOVER_STATELOAD = "Load target state",
	HOVER_TARGETCFG = "Target/Timing specific configuration\\n\\r",
	HOVER_CPUFILTER = "CPU- Based Display Filters",
	HOVER_GLOBALINPUT = "Toggle Global Input ON/OFF",
	HOVER_INPUTCFG = "Switch active input layout",
	HOVER_PLAYLIST = "Show Playlist",

	ROOT_WINDOW    = "Windows",

	VIDREC_RES     = "Vertical Resolution",
	VIDREC_ASPECT  = "Aspect Ratio",
	VIDREC_CODEC   = "Video Codec",
	VIDREC_QUALITY = "Video Quality",
	VIDREC_ACODEC  = "Audio Codec",
	VIDREC_AQUALITY= "Audio Quality",
	VIDREC_FPS     = "Framerate",
	VIDREC_SAVE    = "Destination",
	VIDREC_ASOURCE = "Audio Sources",
	VIDREC_NOKEY   = "No stream.key found, streaming disabled.",
	VIDREC_ADVANCED = "Advanced Settings",

	HELP_GLOBAL = [[
		\#00ff00(global)\n\r\#ffffff
			ESCAPE\tunlock,default cancel,drop popup\n\r
			\t\ttoggle quit dialog\n\r
			LCTRL\tgrab/release input\n\r
			SHIFT+TAB\t cycle visible windows\n\r
			ALT+F4\t close normal (non-media) window\n\r
			RCLICK\t context menu (where applicable)\n\r
			F12\t\tforce-focus window\n\r
			F11\t\tgather/scatter visible windows\n\r\n\r
		\#00ff00(titlebar)\#ffffff\n\r
			SHIFT+CLICK+DRAG\t fling window\n\r
			DBLCLICK\tmaximize / restore (if possible)\n\r\n\r
		\#00ff00(resize icon, if present)\#ffffff\n\r
			DRAG\t - resize window,\n\r
			SHIFT+DRAG\t - resize window, maintain aspect\n\r
	]],

	HELP_TARGET = [[
		\#00ff00(target window)\#ffffff\n\r
			DBLCLICK\t grab global keyboard/mouse\n\r\n\r
		\#00ff00(cpu/displayfilter options)\#ffffff\n\r
			RCLICK\t detailed options\n\r\n\r
		[#00ff00(resize button)\#ffffff\n\r
			RCLICK\t fullscreen/original size switch\n\r
	]],

	HELP_VIDREC = [[
		\#00ff00(canvas)\#ffffff\n\r
		clone-CLICK\t add cursor attachment\n\r
		CLICK\t\t (de-)select object\n\r
		RCLICK\t send backwards (reorder)\n\r
		DBLCLICK\t resize to canvas size\n\r
		DELETE\t remove selected object\n\r
		CENTER:\n\r
		+DRAG\t\t move around\n\r
		+SHIFT+DRAG\t change opacity\n\r
		OFF-CENTER (CORNER):\n\r
		+DRAG\t\tresize\n\r
		+SHIFT+DRAG\t rotate\n\r\n\r
		\#00ff00(audio)\#ffffff\n\r
		capture source icon x-axis sets left/right panning\n\r
		capture source icon y-axis sets gain level\n\r
		multiple recording sessions can't share audio\n\r
	]],

	HELP_3DMEDIA = [[
		\#00ff00(canvas)\#ffffff\n\r
		UP/DOWN/LEFT/RIGHT Zoom/Rotate Model
		DRAG\t\t Rotate Model
		clone-CLICK\t Update Display
	]],

	HELP_AMEDIA = [[
		\#00ff00(media window)\#ffffff\n\r
			LEFT/RIGHT\tseek backward/forward 10s\n\r
			UP/DOWN\tseek backward/formward 30s\n\r
			PGUP/PGDN\tseek backward/forward 600s\n\r
			SHIFT\t*10 modifier to L/R/U/D\n\r
		\#00ff00(playlist window)\#ffffff\n\r
			DELETE\t remove currently selected\n\r
	]],

	HELP_VMEDIA = [[
		\#00ff00(media window)\#ffffff\n\r
			LEFT/RIGHT\tseek backward/forward 10s\n\r
			UP/DOWN\tseek backward/formward 30s\n\r
			PGUP/PGDN\tseek backward/forward 600s\n\r
			SHIFT\t\*10 modifier to L/R/U/D\n\r
	]],

	HELP_INPUT = [[
		\#00ff00(main window)\n\r\#ffffff
		DBLCLICK (New Layout), switch to config window\n\r
		DBLCLICK (Layout), show options (delete, edit)\n\r\n\r
		\#00ff00(config window)\n\r\#ffffff
		DBLCLICK (Label), open mapping dialog\n\r
		RCLICK (Axis-Label), filtering options for axis\n\r
		CLICK (Close icon), update/save/discard options\n\r
	]]
};
