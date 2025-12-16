-- AnnaBypasser
-- contact: annaroblox@gmx.com
-- set your language to Қазақ Тілі* for it to work tutorial (https://www.youtube.com/watch?v=Y-WpfOQiboU)
-- loadstring: loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true))()
if game:GetService("CoreGui"):FindFirstChild("AnnaBypasser") then
	game:GetService("CoreGui"):FindFirstChild("AnnaBypasser"):Destroy()
end
local BypasserGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
BypasserGui.Name = "AnnaBypasser"
local MainFrame = Instance.new("Frame")
local HeaderImage = Instance.new("ImageLabel")
local CommandTextBox = Instance.new("TextBox")
local ExecuteButton = Instance.new("TextButton")
local ErrorMessageBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")
local LocalPlayer = game:GetService("Players").LocalPlayer
MainFrame.Parent = BypasserGui
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.Position = UDim2.new(0.7, 35, 0.7, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
HeaderImage.Size = UDim2.new(1, 0, 0.4, 0)
HeaderImage.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
HeaderImage.Position = UDim2.new(0, 0, -0.3, 0)
HeaderImage.Image = "rbxassetid://84482790380175"
HeaderImage.Parent = MainFrame
local UserInputService = game:GetService("UserInputService")
local IsDragging = nil
local DragStartPosition = nil
local FrameStartPosition = nil
local function UpdateFramePosition(InputObject)
	local PositionDelta = InputObject.Position - DragStartPosition
	MainFrame.Position = UDim2.new(
		FrameStartPosition.X.Scale,
		FrameStartPosition.X.Offset + PositionDelta.X,
		FrameStartPosition.Y.Scale,
		FrameStartPosition.Y.Offset + PositionDelta.Y
	)
end
MainFrame.InputBegan:Connect(function(InputBeginEvent)
	if
		InputBeginEvent.UserInputType == Enum.UserInputType.MouseButton1
		or InputBeginEvent.UserInputType == Enum.UserInputType.Touch
	then
		IsDragging = true
		DragStartPosition = InputBeginEvent.Position
		FrameStartPosition = MainFrame.Position
		InputBeginEvent.Changed:Connect(function()
			if InputBeginEvent.UserInputState == Enum.UserInputState.End then
				IsDragging = false
			end
		end)
	end
end)
MainFrame.InputChanged:Connect(function(InputChangeEvent)
	if
		(
			InputChangeEvent.UserInputType == Enum.UserInputType.MouseMovement
			or InputChangeEvent.UserInputType == Enum.UserInputType.Touch
		) and IsDragging
	then
		UpdateFramePosition(InputChangeEvent)
	end
end)
HeaderImage.InputBegan:Connect(function(InputObject)
	if
		InputObject.UserInputType == Enum.UserInputType.MouseButton1
		or InputObject.UserInputType == Enum.UserInputType.Touch
	then
		IsDragging = true
		DragStartPosition = InputObject.Position
		FrameStartPosition = MainFrame.Position
		InputObject.Changed:Connect(function()
			if InputObject.UserInputState == Enum.UserInputState.End then
				IsDragging = false
			end
		end)
	end
end)
HeaderImage.InputChanged:Connect(function(InputObject)
	if
		(
			InputObject.UserInputType == Enum.UserInputType.MouseMovement
			or InputObject.UserInputType == Enum.UserInputType.Touch
		) and IsDragging
	then
		UpdateFramePosition(InputObject)
	end
end)
CommandTextBox.Parent = MainFrame
CommandTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CommandTextBox.Position = UDim2.new(0.05, 0, 0.05, 0)
CommandTextBox.Size = UDim2.new(0.9, 0, 0.3, 0)
CommandTextBox.Font = Enum.Font.SourceSans
CommandTextBox.PlaceholderText = "Enter text here"
CommandTextBox.Text = ""
CommandTextBox.TextColor3 = Color3.fromRGB(0, 255, 0)
CommandTextBox.TextSize = 14
CommandTextBox.ClearTextOnFocus = true
ExecuteButton.Parent = MainFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
ExecuteButton.Position = UDim2.new(0.25, 0, 0.4, 0)
ExecuteButton.Size = UDim2.new(0.5, 0, 0.15, 0)
ExecuteButton.Font = Enum.Font.SourceSans
ExecuteButton.Text = "Bypass Text"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 14
ErrorMessageBox.Parent = MainFrame
ErrorMessageBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ErrorMessageBox.Position = UDim2.new(0.05, 0, 0.6, 0)
ErrorMessageBox.Size = UDim2.new(0.9, 0, 0.35, 0)
ErrorMessageBox.Font = Enum.Font.SourceSans
ErrorMessageBox.Text = "Bypassed text will appear here"
ErrorMessageBox.TextColor3 = Color3.fromRGB(0, 255, 0)
ErrorMessageBox.TextSize = 14
ErrorMessageBox.TextWrapped = true
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.05, 0, 0.36, 0)
StatusLabel.Size = UDim2.new(0.15, 0, 0.05, 0)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "Filter Check"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14
local ToggleFrame = Instance.new("Frame")
ToggleFrame.Parent = MainFrame
ToggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleFrame.Position = UDim2.new(0.05, 0, 0.43, 0)
ToggleFrame.Size = UDim2.new(0.15, 0, 0.15, 0)
local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Parent = ToggleFrame
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Size = UDim2.new(1, 0, 1, 0)
ToggleLabel.Font = Enum.Font.SourceSansBold
ToggleLabel.Text = "X"
ToggleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
ToggleLabel.TextSize = 24
local IsToggleActive = false
ToggleFrame.InputBegan:Connect(function(InputObject)
	if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
		IsToggleActive = not IsToggleActive
		ToggleLabel.Text = IsToggleActive and "" or "X"
		ToggleFrame.BackgroundColor3 = IsToggleActive and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(40, 40, 40)
	end
end)
local IsBypassEnabled = false
ToggleButton.MouseButton1Click:Connect(function()
	IsBypassEnabled = not IsBypassEnabled
	ToggleButton.BackgroundColor3 = IsBypassEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
end)
local function GenerateRandomString()
	local CharacterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local RandomString = ""
	for LocalPlayer = 1, math.random(80, 90) do
		local RandomIndex = math.random(1, #CharacterSet)
		RandomString = RandomString .. string.sub(CharacterSet, RandomIndex, RandomIndex)
	end
	return RandomString
end
local function SendChatMessage(ChatPrefix)
	if IsBypassEnabled or IsToggleActive then
		for LocalPlayer = 1, 8 do
			local RandomChatContent = GenerateRandomString()
			pcall(function()
				Game.Players:Chat((ChatPrefix .. " " or "(eee) ") .. RandomChatContent)
			end)
		end
	end
end
local FilteredWords = {
	America = "america",
	America = "AMERICA",
	America = "America",
	Anal = "\208\176n\208\176\211\143",
	Anal = "\208\144\206\157\208\144L",
	Anna = "Anna",
	Anti = "anti",
	Anti = "ANTI",
	Ass = "ASS",
	Ass = "a\224\184\152\224\184\152",
	Asses = "a\224\184\152\224\184\152es",
	Asses = "ASSES",
	Asshole = "a\224\184\152\224\184\152ho\211\143e",
	Assholes = "a\224\184\152\224\184\152ho\211\143e\209\149",
	Asshole = "A\217\144\208\133\208\133\208\157\208\158L\208\149",
	Assholes = "A\217\144\208\133\208\133\208\157\208\158L\208\149S",
	FilteredWordAl = "al",
	DraggableFrame = "\225\131\174astard",
	DraggableFrameState = "BA\225\131\189TARD",
	Bastard = "\225\131\174astard",
	bdsm = "bd\224\184\152m",
	BDSM = "BD\225\131\189M",
	beaner = "bea\226\180\150er",
	BEANER = "BEANER",
	bisexual = "bi\224\184\152exual",
	BISEXUAL = "BI\225\131\189EXUAL",
	black = "b\211\143ack",
	bitch = "\225\131\174itch",
	bitches = "\225\131\174itches",
	BITCHES = "BITCHES",
	BITCH = "\225\131\174ITCH",
	blox = "blox",
	blowjob = "b\211\143owjo\225\131\174",
	blowjobs = "b\211\143owjo\225\131\174s",
	InputConnection = "\208\146\227\128\170LOWJ\208\158\208\146",
	DragStartPosition = "bo\226\180\150dage",
	DragStartPositionState = "\225\131\174ONDAGE",
	FramePosition = "\225\131\174\208\190\208\190\225\131\174",
	FramePositionState = "\225\131\174\208\190\208\190\225\131\174ies",
	DragOffset = "\225\131\174\208\190\208\190\225\131\174s",
	DragOffsetState = "B\208\158\208\158\208\146\208\133",
	InputEvent = "B\208\158\208\158\208\146",
	DragHandler = "\225\131\174ooty",
	DragHandlerState = "B\208\158\208\158TY",
	UserInput = "bo\226\180\150g",
	UserInputState = "BONG",
	BypassFrame = "bo\226\180\150er",
	BypassFrame = "Bo\226\180\150er",
	BONER = "BONER",
	breast = "brea\224\184\152t",
	breasts = "brea\224\184\152t\224\184\152",
	breed = "breed",
	bypass = "bypass",
	brazz = "bra\226\180\173\226\180\173",
	BRAZZ = "BRA\225\131\141\225\131\141",
	call = "call",
	chong = "cho\226\180\150g",
	coochie = "cooch\196\177\219\172e",
	Coochie = "Cooch\196\177\219\172e",
	cocaine = "coca\196\177\219\172ne",
	childfucker = "childf\224\184\169cker",
	CHILDFUCKER = "CHILD\234\156\176UCKER",
	chink = "chink",
	CHINK = "CHINK",
	clit = "c\211\143it",
	CLIT = "CLlT",
	commie = "commie",
	commies = "commies",
	COMMIE = "COMMIE",
	COMMIES = "COMMIES",
	cock = "c\219\172\219\172\219\172\219\172\219\172\219\172oc\219\172\219\172\219\172\219\172\219\172\219\172k",
	COCK = "\225\178\131\208\158\208\161K",
	Cock = "\225\178\131\208\190\209\129k",
	cocksuck = "c\219\172\219\172\219\172\219\172\219\172\219\172oc\219\172\219\172\219\172\219\172\219\172\219\172ks\217\144uck",
	COCKSUCK = "\225\178\131\208\158\208\161K\225\130\189UCK",
	cocksucker = "c\215\130\215\130\215\130\215\130ocks\217\144ucker",
	COCKSUCKER = "\225\178\131\208\158\208\161KS\217\144U\208\161K\208\149R",
	condom = "co\226\180\150dom",
	consent = "con\224\184\152ent",
	consented = "con\224\184\152ented",
	CONDOM = "\225\178\131ONDOM",
	CONSENT = "\225\178\131ONSENT",
	CONSENTED = "\225\178\131ONSENTED",
	coon = "coon",
	crack = "crack",
	creampie = "creamp\196\177\219\172e",
	Creampie = "\225\178\131reampie",
	CREAMPIE = "\225\178\131REAMPIE",
	cuck = "c\224\184\169ck",
	Cuck = "C\224\184\169ck",
	CUCK = "\225\178\131U\225\178\131K",
	cum = "c\224\184\169m",
	CUM = "\225\178\131UM",
	cumming = "c\224\184\169mming",
	CUMMING = "\225\178\131UMMING",
	cumslut = "c\224\184\169ms\211\143ut",
	CUMSLUT = "\225\178\131UM\225\131\189LUT",
	cunt = "cu\226\180\150t",
	cunnie = "cu\226\180\150\226\180\150ie",
	CUNNIE = "\225\178\131UNNIE",
	cunts = "cu\226\180\150ts",
	CUNT = "\225\178\131UNT",
	chair = "chair",
	ching = "ching",
	deepthroat = "deepthro\224\184\170t",
	DEEPTHROAT = "\195\144EEPTHROAT",
	deadass = "d\217\144eadass",
	dirty = "dirty",
	DIRTY = "DIRTY",
	dildo = "di\211\143do",
	DILDO = "\195\144ILDO",
	DICK = "\195\144I\225\178\131K",
	dick = "d\215\130\215\130\215\130ick",
	dogfucker = "dogf\224\184\169cker",
	DOGFUCKER = "DOG\234\156\176UCKER",
	drug = "drug",
	drunk = "dr\224\184\169nk",
	discord = "di\224\184\152cord",
	DISCORD = "\195\144ISCORD",
	drugs = "dr\224\184\169g\224\184\152",
	DRUG = "DRUG",
	DRUGS = "\195\144RUGS",
	dumbass = "d\224\184\169mba\224\184\152\224\184\152",
	DUMBASS = "\195\144UMBASS",
	email = "emai\211\143",
	erection = "erectio\226\180\150",
	Erection = "Erectio\226\180\150",
	fagg = "f\224\184\170gg",
	fag = "f\224\184\170g",
	Fagg = "\234\156\176\224\184\170ggot",
	faggot = "f\224\184\170\225\184\161\225\184\161ot",
	Faggot = "\234\156\176aggot",
	FAGGOT = "\234\156\176AGGOT",
	faggots = "f\217\144aggots",
	FAGGOTS = "\234\156\176AGGOTS",
	fags = "f\224\184\170gs",
	fatass = "f\217\144atass",
	Fat = "\234\156\176at",
	FAT = "\234\156\176AT",
	Fatass = "F\217\144ata\224\184\152\224\184\152",
	fatasses = "fata\224\184\152\224\184\152es",
	FATASS = "\234\156\176ATASS",
	FilteredWordFi = "fi",
	FilteredWordFI = "FI",
	FilteredWordFl = "fl",
	FUCK = "\234\156\176UCK",
	fuck = "f\224\184\169ck",
	Fuck = "\234\156\176uck",
	fucking = "f\224\184\169\209\129k\209\150ng",
	FUCKING = "\234\156\176UCKING",
	fuckable = "f\224\184\169ckable",
	FUCKABLE = "\234\156\176UCKABLE",
	fuckboy = "f\224\184\169ckboy",
	Fuckboy = "\234\156\176uckboy",
	FUCKBOY = "\234\156\176UCKBOY",
	fucked = "f\224\184\169cked",
	fucker = "f\224\184\169cker",
	fucks = "f\224\184\169cks",
	Fucked = "\234\156\176ucked",
	Fucker = "\234\156\176ucker",
	Fucks = "\234\156\176ucks",
	FUCKED = "\234\156\176UCKED",
	FUCKER = "\234\156\176UCKER",
	FUCKS = "\234\156\176UCKS",
	fucktard = "f\224\184\169cktard",
	Fucktard = "\234\156\176ucktard",
	FUCKTARD = "\234\156\176UCKTARD",
	fucktoy = "f\224\184\169cktoy",
	FUCKTOY = "\234\156\176UCKTOY",
	Fucktoy = "\234\156\176ucktoy",
	give = "give",
	girl = "gir\211\143",
	Girl = "Gir\211\143",
	GIRL = "GIRL",
	grop = "g\234\158\133op",
	GROP = "G\215\133ROP",
	Grop = "G\234\158\133op",
	gender = "ge\226\180\150der",
	Gender = "Ge\226\180\150der",
	genocide = "ge\226\180\150ocide",
	Genocide = "Ge\226\180\150ocide",
	google = "goog\211\143e",
	Google = "Goog\211\143e",
	have = "have",
	handjob = "ha\226\180\150djob",
	heil = "hei\211\143",
	hentai = "he\226\180\150ta\196\177\219\172",
	BypassImage = "He\226\180\150ta\196\177\219\172",
	BypassImage = "H\217\144ENTAl",
	DraggingActive = "he\196\177\219\172\211\143",
	DraggingActive = "HEIL",
	DragStartPosition = "\210\187\196\177\219\172t\211\143\208\181\208\179",
	DragStartPosition = "H\196\177\219\172t\211\143\208\181\208\179",
	DraggingActive = "H\217\144EIL",
	DragStartPosition = "H\217\144ITLER",
	DragStartOffset = "holocau\224\184\152t",
	InputService = "HOE",
	InputService = "hoe",
	DragUpdateFunction = "holy",
	DragUpdateFunction = "homo\224\184\152exual",
	DragUpdateFunction = "Homo\224\184\152exual",
	hooker = "hooke\234\158\133",
	horny = "hor\226\180\150y",
	Hooker = "Hooke\234\158\133",
	Horny = "Hor\226\180\150y",
	HOMOSEXUAL = "HOMO\224\184\152exUAL",
	HOOKER = "H\217\144OOKER",
	HORNY = "H\217\144ORNY",
	instagram = "in\224\184\152tagram",
	INSTAGRAM = "I\217\144NSTAGRAM",
	isis = "i\217\144s\217\144i\217\144s\217\144",
	FilteredWordIm = "im",
	FilteredWordIp = "ip",
	FilteredWordIP = "IP",
	FilteredWordId = "id",
	FilteredWordIl = "il",
	FilteredWordIs = "is",
	FilteredWordLe = "le",
	FilteredWordIg = "ig",
	FilteredWordIv = "iv",
	FilteredWordIe = "ie",
	FilteredWordLl = "ll",
	FilteredWordIr = "ir",
	InputIndex = "ii",
	LastYPosition = "ly",
	LastOffset = "lo",
	FilteredWordIm = "im",
	InputMode = "IM",
	LoadDelay = "ld",
	FrameTime = "ft",
	InputCount = "ic",
	InputX = "ix",
	InputNotEnabled = "INE",
	ING = "ING",
	jesus = "jesus",
	Jesus = "Jesus",
	jackass = "jacka\224\184\152\224\184\152",
	JACKASS = "J\217\144ACKASS",
	jungle = "jung\211\143e",
	jew = "jew",
	jews = "jews",
	jerking = "j\217\144erking",
	JERKMATE = "J\217\144ERKMATE",
	job = "j\217\144ob",
	jig = "j\196\177\219\172g",
	jigaboo = "j\217\144igaboo",
	jiggaboo = "j\217\144iggaboo",
	Jig = "J\217\144ig",
	kkk = "kkk",
	KKK = "KKK",
	kys = "kys",
	kill = "k\196\177\219\172ll",
	Kill = "\225\180\139\196\177\219\172ll",
	KILL = "K\217\144ILL",
	killing = "k\196\177\219\172lling",
	killed = "ki\211\143\211\143ed",
	KILLING = "KILLING",
	KILLED = "K\217\144ILLED",
	knife = "knife",
	KNIFE = "KNIFE",
	kiss = "kiss",
	kissing = "k\196\177\219\172ssing",
	KISS = "KISS",
	KISSING = "KISSING",
	kinky = "ki\226\180\150ky",
	kike = "k\196\177\219\172ke",
	KINKY = "Ki\226\180\150ky",
	lap = "\211\143ap",
	LMAO = "LMAO",
	lmao = "\211\143mao",
	love = "\211\143ove",
	like = "like",
	LIKE = "LIKE",
	luck = "luck",
	lust = "\211\143ust",
	LUST = "L\217\144UST",
	Lust = "L\224\184\169st",
	liberal = "liberal",
	LIBERAL = "LIBERAL",
	Liberal = "Liberal",
	lsd = "\211\143sd",
	LSD = "L\217\144SD",
	lgbtq = "\211\143gbtq",
	masturbate = "ma\224\184\152turbate",
	Masturbate = "Ma\224\184\152turbate",
	mexican = "mexican",
	MEXICAN = "MEXICAN",
	myass = "my\8a\224\184\152\224\184\152",
	MYASS = "MY\8A\217\144SS",
	mississippi = "mississippi",
	MISSISSIPPI = "MISSISSIPPI",
	milf = "mi\211\143f",
	Milf = "Mi\211\143f",
	molest = "mole\224\184\152t",
	Molest = "Mole\224\184\152t",
	MOLEST = "MOLE\225\131\189T",
	motherfucker = "motherf\224\184\169cker",
	Motherfucker = "Motherf\224\184\169cker",
	motherfucking = "motherf\224\184\169cking",
	MOTHERFUCKER = "MOTHER\234\156\176UCKER",
	MOTHERFUCKING = "MOTHER\234\156\176UCKING",
	naked = "\226\180\150aked",
	Naked = "N\217\144aked",
	nazi = "na\226\180\173i",
	NAZI = "NA\225\131\141I",
	negro = "\226\180\150egro",
	Negro = "N\217\144egro",
	negrophobia = "\226\180\150egrophobia",
	negroes = "\226\180\150egroes",
	NAKED = "N\217\144AKED",
	NEGRO = "N\217\144EGRO",
	NEGROES = "N\217\144EGROES",
	nice = "nice",
	NICE = "NICE",
	NIGGA = "NlGGA",
	Nigga = "N\217\144igga",
	nig = "\226\180\150\225\191\152g",
	niger = "\226\180\150\225\191\152ger",
	nigeria = "\226\180\150\225\191\152geria",
	niglet = "\226\180\150iglet",
	niglets = "\226\180\150iglet\209\149",
	nigg = "\226\180\150\225\191\152gg",
	Nigg = "N\217\144igg",
	NIGG = "N\217\144IGG",
	nigga = "\226\180\150igg\224\184\170",
	niggas = "\226\180\150igg\224\184\170\224\184\152",
	niggers = "\226\180\150\225\191\152gge\234\158\133\224\184\152",
	nigger = "\226\180\150\225\191\152gge\234\158\133",
	NIGGER = "N\217\144IGGER",
	NIGGERS = "N\217\144\217\144IGGERS",
	NiggerSex = "N\217\144igger\225\131\189ex",
	nsfw = "\226\180\150sfw",
	Nsfw = "N\217\144sfw",
	nude = "\226\180\150ude",
	Nude = "N\217\144ude",
	nudes = "\226\180\150udes",
	Nudes = "N\217\144udes",
	NSFW = "N\217\144SFW",
	NUDE = "N\217\144UDE",
	NUDES = "\206\157\217\144UDES",
	orgy = "o\234\158\133gy",
	ORGY = "O\217\144RGY",
	panties = "pa\226\180\150ties",
	Panties = "Pa\226\180\150ties",
	penis = "peni\224\184\152",
	PENIS = "PENI\225\131\189",
	PORNHUB = "P\217\144ORNHUB",
	PORN = "P\217\144ORN",
	Porn = "Por\226\180\150",
	power = "p\217\144ower",
	POWER = "P\217\144OWER",
	pussy = "pu\224\184\152\224\184\152y",
	Pussy = "Pu\224\184\152\224\184\152y",
	PUSSY = "PU\225\131\189\225\131\189Y",
	prostitute = "pro\224\184\152titute",
	PROSTITUTE = "P\217\144\217\144ROSTITUTE",
	pick = "pick",
	phile = "ph\196\177\219\172\211\143e",
	pedophile = "pedoph\196\177\219\172\211\143e",
	racist = "racist",
	rape = "r\224\184\170\209\128\208\181",
	Rape = "R\224\184\170\209\128\208\181",
	RAPE = "R\208\144\208\160\208\149",
	raped = "r\224\184\170p\208\181d",
	Raped = "r\224\184\170p\208\181d",
	RAPED = "R\208\144P\208\149D",
	raping = "rapi\226\180\150g",
	rapist = "rapi\224\184\152t",
	rapists = "rapi\224\184\152t\209\149",
	RAPIST = "R\208\144P\211\128\208\133\208\162",
	Raping = "Rapi\226\180\150g",
	Rapist = "Rapi\224\184\152t",
	raghead = "r\224\184\170ghead",
	Raghead = "R\217\144aghead",
	RAGHEAD = "R\217\144AGHEAD",
	redskin = "redski\226\180\150",
	Redskin = "Redski\226\180\150",
	retard = "r\208\181t\224\184\170rd",
	RETARD = "R\217\144\217\144ETARD",
	roblox = "roblox",
	republican = "republican",
	Republican = "Republican",
	says = "s\217\144ays",
	Says = "S\217\144ays",
	SAYS = "S\217\144AYS",
	script = "script",
	semen = "seme\226\180\150",
	Semen = "Seme\226\180\150",
	SEMEN = "\225\131\189EMEN",
	seduc = "s\217\144educ",
	DragStartPosition = "\225\131\189educ",
	DraggableFrame = "SEDUC",
	InputChangedHandler = "\224\184\152ex",
	DragHandler = "\225\131\189ex",
	DragOffset = "\225\131\189EX",
	DragState = "\224\184\152exist",
	sext = "\224\184\152ext",
	sextoy = "\224\184\152extoy",
	sexual = "\224\184\152exual",
	sexy = "\224\184\152exy",
	sexdoll = "\224\184\152exdoll",
	Sexdoll = "\224\184\152exdoll",
	shit = "\224\184\152hit",
	Shit = "\225\131\189hit",
	SHIT = "\225\131\189\208\157\211\128\208\162",
	should = "should",
	shot = "s\217\144hot",
	Shot = "\225\131\189hot",
	spic = "s\217\144pic",
	Spic = "sp\196\177\219\172c",
	SPIC = "\225\131\189PIC",
	FramePosition = "SIEG",
	DragInputBegan = "\225\131\189LAVE",
	InputBeganHandler = "\224\184\152\211\143ave",
	DragInputChanged = "\225\131\189LAVERY",
	DragInputEnd = "\225\131\189LAVES",
	MouseButtonHandler = "S\211\143ave",
	TouchInputHandler = "\209\149lur",
	InputStateChanged = "\209\149\211\143ut",
	UserInputService = "\225\131\189LUT",
	CoreGuiService = "\208\133\211\143ut",
	ScreenGuiInstance = "\224\184\152trip",
	MainFrame = "\225\131\189TRIP",
	ImageLabelInstance = "s\224\184\169cker",
	TextBoxInstance = "S\224\184\169cker",
	TextButtonInstance = "\225\131\189UCKER",
	LocalPlayerReference = "SUCKING",
	snapchat = "s\226\180\150apchat",
	Snapchat = "S\226\180\150apchat",
	sperm = "\224\184\152perm",
	Sperm = "\225\131\189perm",
	sperms = "\224\184\152perms",
	SNAPCHAT = "\225\131\189NAPCHAT",
	SPERM = "\225\131\189PERM",
	stupid = "\224\184\152tupid",
	suicide = "\224\184\152uicide",
	TARD = "T\217\144ARD",
	terrorist = "terrori\224\184\152t",
	terrorism = "terrori\224\184\152m",
	this = "thi\224\184\152",
	THIS = "THI\225\131\189",
	threesome = "three\224\184\152ome",
	Threesome = "Three\224\184\152ome",
	THREESOME = "THREE\225\131\189OME",
	thong = "tho\226\180\150g",
	tits = "t\196\177\219\172t\224\184\152",
	titt = "t\196\177\219\172tt",
	titties = "t\196\177\219\172tties",
	TITTIES = "T\217\144ITTIES",
	Titt = "T\196\177\219\172tt",
	Tits = "T\196\177\219\172t\224\184\152",
	tiktok = "tiktok",
	TONIGHT = "TONIGHT",
	tranny = "tr\224\184\170nny",
	trannie = "trann\196\177\219\172e",
	TRANNY = "T\217\144RANNY",
	DragFrame = "TRANNlE",
	InputService = "TRUM\208\160",
	LocalPlayer = "trum\209\128",
	GuiFrame = "tw\224\184\170t",
	LogoImage = "T\217\144wat",
	CommandInput = "\217\144T\217\144WAT",
	ExecuteButton = "twi\226\180\150k",
	ScriptInput = "twinks",
	RunButton = "vagi\226\180\150a",
	IsDragging = "Vagi\226\180\150a",
	DragStartPos = "w\217\144eed",
	DragStartUdim = "W\217\144eed",
	UpdateFramePosition = "W\217\144EED",
	well = "well",
	InputEvent = "w\217\144etb\224\184\170ck",
	MouseButtonEvent = "W\217\144etback",
	TouchEvent = "W\217\144ETBACK",
	whore = "\224\184\158\224\184\186hore",
	Whore = "W\217\144hore",
	whores = "w\217\144hores",
	Whores = "W\217\144hores",
	WHORE = "W\217\144HORE",
	white = "w\210\187\209\150t\208\181",
	White = "W\210\187\209\150t\208\181",
	xxx = "\211\189\211\189\211\189",
	XXX = "X\217\144X\217\144X\217\144",
	youtube = "yout\224\184\169be",
	YOUTUBE = "Y\217\144OUTUBE",
	Youtube = "Yout\224\184\169be",
	your = "yo\224\184\169r",
	Your = "Yo\224\184\169r",
	zoophile = "zooph\196\177\219\172Ie",
}
local function ReplaceICharacter(InputString)
	return InputString:gsub("i", "\196\177\219\172")
end
local function ReplaceXxxString(InputText)
	return InputText:gsub("xxx", "\211\189\211\189\211\189")
end
local function ReplaceLCharacter(InputContent)
	return InputContent:gsub("l", "\211\143")
end
local function ReplaceI(InputString)
	return InputString:gsub("I", "I")
end
local function ReplaceRape(InputString)
	return InputString:gsub("rape", "r\224\184\170\209\128\208\181")
end
local function ReplaceRAPECaps(InputString)
	return InputString:gsub("RAPE", "R\208\144\208\160\208\149")
end
local function ReplacePorn(InputString)
	return InputString:gsub("porn", "por\226\180\150")
end
local function FilterSexWord(FilteredText)
	return FilteredText:gsub("sex", "\224\184\152ex")
end
local function FilterCumsWord(InputTextCums)
	return InputTextCums:gsub("cums", "c\224\184\169ms")
end
local function FilterCumWord(InputTextCum)
	return InputTextCum:gsub("cum", "c\224\184\169m")
end
local function FilterFaggotWord(InputTextFaggot)
	return InputTextFaggot:gsub("faggot", "f\224\184\170ggot")
end
local function FilterCockWord(InputTextCock)
	return InputTextCock:gsub("cock", "c\217\144\208\190\209\129k")
end
local function CensorFuck(InputText)
	return InputText:gsub("fuck", "f\224\184\169ck")
end
local function CensorTard(InputText)
	return InputText:gsub("tard", "t\217\144ard")
end
local function CensorIn(InputText)
	return InputText:gsub("in", "in")
end
local function CensorIng(InputText)
	return InputText:gsub("ing", "ing")
end
local function CensorIth(InputText)
	return InputText:gsub("ith", "ith")
end
local function ReplaceText(InputText)
	return InputText:gsub("it", "it")
end
local CharacterMap = {
	G = "g",
	I = "\196\177\219\172",
	J = "j\217\144",
	L = "l",
	Y = "y",
	I = "l",
}
local function ProcessText(InputString)
	local CleanedText = InputString:gsub("[%p%c%s]", "")
	local PatternIterator, PatternState, CurrentMatch = InputString:gmatch("[%p%c%s]")
	local MatchesTable = {}
	while true do
		CurrentMatch = PatternIterator(PatternState, CurrentMatch)
		if CurrentMatch == nil then
			break
		end
		table.insert(MatchesTable, CurrentMatch)
	end
	if FilteredWords[CleanedText] then
		local PrefixMatch = InputString:match("^([%p%c%s]*)")
		local SuffixMatch = InputString:match("([%p%c%s]*)$")
		return PrefixMatch .. FilteredWords[CleanedText] .. SuffixMatch
	end
	local DictionaryIterator, CurrentKey, CurrentValue = pairs(FilteredWords)
	while true do
		CurrentValue = DictionaryIterator(CurrentKey, CurrentValue)
		if CurrentValue == nil then
			break
		end
		if CleanedText:find(CurrentValue) then
			return InputString:gsub(CurrentValue, FilteredWords[CurrentValue])
		end
	end
	if #CleanedText < 4 then
		return InputString
	end
	if InputString:find("rape") then
		return ReplaceRape(InputString)
	end
	if InputString:find("RAPE") then
		return ReplaceRAPECaps(InputString)
	end
	if InputString:find("ith") then
		return CensorIth(InputString)
	end
	if InputString:find("ing") then
		return CensorIng(InputString)
	end
	if InputString:find("tard") then
		return CensorTard(InputString)
	end
	if InputString:find("it") then
		return ReplaceText(InputString)
	end
	if InputString:find("in") then
		return CensorIn(InputString)
	end
	if InputString:find("i") then
		return ReplaceICharacter(InputString)
	end
	if InputString:find("xxx") then
		return ReplaceXxxString(InputString)
	end
	if InputString:find("l") then
		return ReplaceLCharacter(InputString)
	end
	if InputString:find("I") then
		return ReplaceI(InputString)
	end
	if InputString:find("porn") then
		return ReplacePorn(InputString)
	end
	if InputString:find("sex") then
		return FilterSexWord(InputString)
	end
	if InputString:find("cums") then
		return FilterCumsWord(InputString)
	end
	if InputString:find("cum") then
		return FilterCumWord(InputString)
	end
	if InputString:find("faggot") then
		return FilterFaggotWord(InputString)
	end
	if InputString:find("cock") then
		return FilterCockWord(InputString)
	end
	if InputString:find("fuck") then
		return CensorFuck(InputString)
	end
	local FirstCharacter = InputString:sub(1, 1)
	local RemainingString = InputString:sub(2)
	return (CharacterMap[FirstCharacter] or FirstCharacter) .. RemainingString
end
local function ParseCommand()
	local IteratorFunction, IteratorState, CurrentToken = CommandTextBox.Text:gmatch("%S+")
	local TokenList = {}
	local OutputString = ""
	local TokenCounter = 0
	while true do
		CurrentToken = IteratorFunction(IteratorState, CurrentToken)
		if CurrentToken == nil then
			break
		end
		table.insert(TokenList, CurrentToken)
	end
	local IteratorFunction, TokenTable, CurrentIndex = ipairs(TokenList)
	while true do
		local CurrentValue
		CurrentIndex, CurrentValue = IteratorFunction(TokenTable, CurrentIndex)
		if CurrentIndex == nil then
			break
		end
		OutputString = OutputString .. ProcessText(CurrentValue)
		TokenCounter = TokenCounter + 1
		if CurrentIndex < #TokenList then
			if TokenCounter % 7 ~= 0 or CurrentIndex >= #TokenList - 1 then
				OutputString = OutputString .. "\8"
			else
				OutputString = OutputString .. " "
			end
		end
	end
	ErrorMessageBox.Text = OutputString
	return OutputString
end
local PlayersService = game:GetService("Players")
local LocalPlayer = PlayersService.LocalPlayer
local function FilterChatMessage(MessageText)
	local FilteredMessage = game:GetService("Chat"):FilterStringAsync(MessageText, LocalPlayer, LocalPlayer)
	return FilteredMessage == MessageText, FilteredMessage
end
local function HandleChatCommand(CommandText)
	if CommandText:sub(1, 2) == "/e" or CommandText:sub(1, 2) == "\\e" then
		if CommandText:sub(1, 2) == "\\e" then
			CommandText = "/e" .. CommandText:sub(3)
		end
		game.Players:Chat(CommandText)
		return
	else
		local CommandResult = ParseCommand(CommandText)
		local Success, ResponseMessage, LocalPlayer = pcall(function()
			return FilterChatMessage(CommandResult)
		end)
		if Success then
			if IsToggleActive then
				if ResponseMessage then
					if not previewMode then
						pcall(function()
							SendChatMessage("AntiTags - AnnaBypasser")
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
								:FireServer(CommandResult, "All")
							task.wait(1)
							SendChatMessage("AntiTags - AnnaBypasser")
						end)
					end
					pcall(function()
						game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(CommandResult)
					end)
					ErrorMessageBox.Text = CommandResult
					ErrorMessageBox.TextColor3 = Color3.fromRGB(0, 255, 0)
				else
					ErrorMessageBox.Text = "Text Filtered: resetting filter"
					ErrorMessageBox.TextColor3 = Color3.fromRGB(255, 0, 0)
					SendChatMessage("AntiTags - AnnaBypasser")
				end
			else
				if not previewMode then
					pcall(function()
						SendChatMessage()
						workspace.Main.Chatted:FireServer(CommandResult)
					end)
					SendChatMessage()
				end
				pcall(function()
					SendChatMessage("Anti Tags - AnnaBypasser")
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
						:FireServer(CommandResult, "All")
					task.wait(1)
					SendChatMessage("Anti Tags - AnnaBypasser")
				end)
				pcall(function()
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(CommandResult)
				end)
				ErrorMessageBox.Text = CommandResult
				ErrorMessageBox.TextColor3 = Color3.fromRGB(0, 255, 0)
			end
		else
			ErrorMessageBox.Text = "Error filtering message"
			ErrorMessageBox.TextColor3 = Color3.fromRGB(255, 0, 0)
		end
	end
end
CommandTextBox.FocusLost:Connect(function(EnterPressed)
	if EnterPressed then
		HandleChatCommand(CommandTextBox.Text)
	end
end)
ExecuteButton.MouseButton1Click:Connect(function()
	HandleChatCommand(CommandTextBox.Text)
end)
local function ToggleGui()
	BypasserGui.Enabled = not BypasserGui.Enabled
end
UserInputService.InputBegan:Connect(function(InputObject, IsGameProcessed)
	if not IsGameProcessed and InputObject.KeyCode == Enum.KeyCode.RightControl then
		ToggleGui()
	end
end)
UserInputService.InputBegan:Connect(function(InputObject, IsProcessed)
	if
		not IsProcessed and (InputObject.KeyCode == Enum.KeyCode.Slash or InputObject.KeyCode == Enum.KeyCode.BackSlash)
	then
		wait(0)
		CommandTextBox.Text = ""
		CommandTextBox:CaptureFocus()
	end
end)
local NotificationCache = {}
local function SendNotification(NotificationText)
	local NotificationGui = Instance.new("ScreenGui")
	local NotificationLabel = Instance.new("TextLabel")
	NotificationGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	NotificationLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
	NotificationLabel.Position = UDim2.new(0.25, 0, 0.45, 0)
	NotificationLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	NotificationLabel.Text = NotificationText
	NotificationLabel.Parent = NotificationGui
	wait(7)
	NotificationGui:Destroy()
end
local function CheckPlayerPresence(PlayerName)
	if not NotificationCache[PlayerName] then
		local FoundPlayer = PlayersService:FindFirstChild(PlayerName)
		if FoundPlayer then
			NotificationCache[PlayerName] = true
			SendNotification("script creator is in game!" .. " - " .. FoundPlayer.Name)
			pcall(function()
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
					:FireServer("script creator is in game!" .. " - " .. FoundPlayer.Name, "All")
			end)
			pcall(function()
				game:GetService("TextChatService").TextChannels.RBXGeneral
					:SendAsync("script creator is in game!" .. " - " .. FoundPlayer.Name)
			end)
		end
	end
end
local function FindChatSystem()
	local ChatSystemEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
	if ChatSystemEvents then
		if not ChatSystemEvents:FindFirstChild("SayMessageRequest") then
			SendNotification("SayMessageRequest is missing! Please note that antilogger might not work properly.")
		end
	else
		SendNotification("textchatservice detected antilogger wont work here use at your own risk")
	end
end
FindChatSystem()
FindChatSystem()
loadstring([=[local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local LocalPlayer = Players.LocalPlayer

-- Global variable to ensure the script doesn't run multiple times
if _G.scriptIsRunning then return end
_G.scriptIsRunning = true

-- Set the number of random strings to generate on key press
local numberOfStrings = 8
if type(numberOfStrings) ~= 'number' or numberOfStrings <= 0 then
    numberOfStrings = 8
end

local function generateRandomString()
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local length = math.random(80, 90)
    local randomString = ""
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        randomString = randomString .. string.sub(chars, randomIndex, randomIndex)
    end
    return randomString
end

local function modifyString(randomText)
    local modified = ""
    for char in randomText:gmatch(".") do
        if char ~= " " then
            modified = modified .. char .. ""
        end
    end
    return modified
end

-- Function to broadcast the message
local function broadcastMessage(modified)
    game.Players:Chat("/e " .. modified)
end

-- Allow global access to broadcastMessage function
_G.broadcastMessage = function(text)
    local modified = modifyString(text)
    broadcastMessage(modified)
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.R then
        for i = 1, numberOfStrings do
            local randomText = generateRandomString()
            local modified = modifyString(randomText)
            broadcastMessage(modified)
        end
    end
end)
]=])()
local function FilterChatMessage(MessageToFilter)
	local FilterSuccess, FilteredMessage = pcall(function()
		return game:GetService("Chat"):FilterStringAsync(MessageToFilter, LocalPlayer, LocalPlayer)
	end)
	if FilterSuccess then
		FilterSuccess = FilteredMessage == MessageToFilter
	end
	return FilterSuccess, FilteredMessage
end
local function CheckPlayerValidity(InputMessage)
	local IsValidPlayer, LocalPlayer = FilterChatMessage(InputMessage)
	if IsValidPlayer then
		if IsValidPlayer then
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = "AnnaBypasser Loaded Successfully!",
				Color = Color3.fromRGB(0, 255, 0),
				Font = Enum.Font.SourceSans,
				TextSize = 20,
			})
		end
	else
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "error checking filter make sure your language is set to \210\154\208\176\208\183\208\176\210\155 \208\162\209\150\208\187\209\150* if you dont know how watch youtube.com/watch?v=Y-WpfOQiboU",
			Color = Color3.fromRGB(255, 0, 0),
			Font = Enum.Font.SourceSans,
			TextSize = 20,
		})
	end
end
