-- set language to Қазақ Тілі* 
-- for the unicode place put a combining character heres a list: https://pastebin.com/tqBTvAj2

if game:GetService("CoreGui"):FindFirstChild("ChatBypass") then
	game:GetService("CoreGui"):FindFirstChild("ChatBypass"):Destroy()
end
local ChatBypassGui = Instance.new("ScreenGui")
ChatBypassGui.Name = "ChatBypass"
local MainFrame = Instance.new("Frame")
local InputTextBox = Instance.new("TextBox")
local SendButton = Instance.new("TextButton")
local OutputTextBox = Instance.new("TextBox")
local InputTextBox = Instance.new("TextBox")
local ToggleButtonFrame = Instance.new("Frame")
local BypassText = ""
local IsBypassEnabled = true
local function GenerateRandomString()
	local AlphabetCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local RandomStringResult = ""
	for _ = 1, math.random(80, 90) do
		local RandomIndex = math.random(1, #AlphabetCharacters)
		RandomStringResult = RandomStringResult .. string.sub(AlphabetCharacters, RandomIndex, RandomIndex)
	end
	return RandomStringResult
end
local function SendBypassMessages()
	if IsBypassEnabled then
		for _ = 1, 8 do
			local RandomString = GenerateRandomString()
			pcall(function()
				Game.Players:Chat("(eee) " .. RandomString)
			end)
		end
	end
end
ChatBypassGui.Parent = game.CoreGui
MainFrame.Parent = ChatBypassGui
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
ToggleButtonFrame.Parent = MainFrame
ToggleButtonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButtonFrame.Position = UDim2.new(0.05, 0, 0.45, 0)
ToggleButtonFrame.Size = UDim2.new(0.1, 0, 0.1, 0)
local BypassLabel = Instance.new("TextLabel")
BypassLabel.Parent = MainFrame
BypassLabel.BackgroundTransparency = 1
BypassLabel.Position = UDim2.new(0.05, 0, 0.4, 0)
BypassLabel.Size = UDim2.new(0.1, 0, 0.1, 0)
BypassLabel.Font = Enum.Font.SourceSansBold
BypassLabel.Text = "bypass every letter"
BypassLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BypassLabel.TextSize = 12
local ToggleIndicator = Instance.new("TextLabel")
ToggleIndicator.Parent = ToggleButtonFrame
ToggleIndicator.BackgroundTransparency = 1
ToggleIndicator.Size = UDim2.new(1, 0, 1, 0)
ToggleIndicator.Font = Enum.Font.SourceSansBold
ToggleIndicator.Text = ""
ToggleIndicator.TextColor3 = Color3.fromRGB(0, 255, 0)
ToggleIndicator.TextSize = 24
local IsToggled = false
ToggleButtonFrame.InputBegan:Connect(function(InputObject)
	if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
		IsToggled = not IsToggled
		ToggleIndicator.Text = IsToggled and "X" or ""
		ToggleButtonFrame.BackgroundColor3 = IsToggled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(40, 40, 40)
	end
end)
local BypassLabel = Instance.new("TextLabel")
BypassLabel.Parent = MainFrame
BypassLabel.BackgroundTransparency = 1
BypassLabel.Position = UDim2.new(0.7, 0, 0.38, 0)
BypassLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
BypassLabel.Font = Enum.Font.SourceSans
BypassLabel.Text = "Unicode"
BypassLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BypassLabel.TextSize = 14
InputTextBox.Parent = MainFrame
InputTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InputTextBox.Position = UDim2.new(0.7, 0, 0.5, -11)
InputTextBox.Size = UDim2.new(0.3, 0, 0.1, 0)
InputTextBox.Font = Enum.Font.SourceSans
InputTextBox.PlaceholderText = "Enter combining character"
InputTextBox.Text = "\205\143"
InputTextBox.TextColor3 = Color3.fromRGB(0, 255, 0)
InputTextBox.TextSize = 14
InputTextBox.FocusLost:Connect(function()
	if InputTextBox.Text then
		BypassText = InputTextBox.Text
	end
end)
InputTextBox.Parent = MainFrame
InputTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InputTextBox.Position = UDim2.new(0.05, 0, 0.05, 0)
InputTextBox.Size = UDim2.new(0.9, 0, 0.3, 0)
InputTextBox.Font = Enum.Font.SourceSans
InputTextBox.PlaceholderText = "Enter text here"
InputTextBox.Text = ""
InputTextBox.TextColor3 = Color3.fromRGB(0, 255, 0)
InputTextBox.TextSize = 14
InputTextBox.ClearTextOnFocus = false
SendButton.Parent = MainFrame
SendButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
SendButton.Position = UDim2.new(0.25, 0, 0.4, 0)
SendButton.Size = UDim2.new(0.5, 0, 0.15, 0)
SendButton.Font = Enum.Font.SourceSans
SendButton.Text = "Bypass Text"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 14
OutputTextBox.Parent = MainFrame
OutputTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
OutputTextBox.Position = UDim2.new(0.05, 0, 0.6, 0)
OutputTextBox.Size = UDim2.new(0.9, 0, 0.35, 0)
OutputTextBox.Font = Enum.Font.SourceSans
OutputTextBox.Text = "Processed text will appear here"
OutputTextBox.TextColor3 = Color3.fromRGB(0, 255, 0)
OutputTextBox.TextSize = 14
OutputTextBox.TextWrapped = true
OutputTextBox.TextEditable = false
OutputTextBox.ClearTextOnFocus = true
local UserInputService = game:GetService("UserInputService")
local IsDragging = nil
local DragStartPosition = nil
local OriginalFramePosition = nil
local function HandleDrag(InputObject)
	local DragDelta = InputObject.Position - DragStartPosition
	MainFrame.Position = UDim2.new(
		OriginalFramePosition.X.Scale,
		OriginalFramePosition.X.Offset + DragDelta.X,
		OriginalFramePosition.Y.Scale,
		OriginalFramePosition.Y.Offset + DragDelta.Y
	)
end
MainFrame.InputBegan:Connect(function(InputEvent)
	if
		InputEvent.UserInputType == Enum.UserInputType.MouseButton1
		or InputEvent.UserInputType == Enum.UserInputType.Touch
	then
		IsDragging = true
		DragStartPosition = InputEvent.Position
		OriginalFramePosition = MainFrame.Position
		InputEvent.Changed:Connect(function()
			if InputEvent.UserInputState == Enum.UserInputState.End then
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
		HandleDrag(InputChangeEvent)
	end
end)
local IsBypassActive = false
local function ParseChatText()
	local WordIterator, Pattern, CurrentWord = InputTextBox.Text:gmatch("%S+")
	local WordsTable = {}
	local ProcessedText = ""
	while true do
		CurrentWord = WordIterator(Pattern, CurrentWord)
		if CurrentWord == nil then
			break
		end
		table.insert(WordsTable, CurrentWord)
	end
	local IteratorFunction, CurrentIndex, TableState = ipairs(WordsTable)
	local CharacterCount = 0
	while true do
		local CurrentIndex, CurrentString = IteratorFunction(CurrentIndex, TableState)
		if CurrentIndex == nil then
			break
		end
		local BypassedText = ""
		if IsToggled then
			local IteratorFunc, IteratorState, CurrentChar = CurrentString:gmatch(".")
			TableState = CurrentIndex
			while true do
				CurrentChar = IteratorFunc(IteratorState, CurrentChar)
				if CurrentChar == nil then
					break
				end
				BypassedText = BypassedText .. CurrentChar .. BypassText
			end
		else
			local IteratorFunc, IteratorState, CurrentCharacter = CurrentString:gmatch(".")
			TableState = CurrentIndex
			local LetterCount = 0
			while true do
				CurrentCharacter = IteratorFunc(IteratorState, CurrentCharacter)
				if CurrentCharacter == nil then
					break
				end
				if CurrentCharacter:match("[%a]") then
					LetterCount = LetterCount + 1
					if 2 < LetterCount and LetterCount % 3 == 0 then
						BypassedText = BypassedText .. BypassText .. CurrentCharacter
					else
						BypassedText = BypassedText .. CurrentCharacter
					end
				else
					BypassedText = BypassedText .. CurrentCharacter
				end
			end
		end
		ProcessedText = ProcessedText .. BypassedText
		CharacterCount = CharacterCount + 1
		if CurrentIndex < #WordsTable then
			if CharacterCount % 7 ~= 0 or CurrentIndex >= #WordsTable - 1 then
				ProcessedText = ProcessedText .. "\8"
			else
				ProcessedText = ProcessedText .. " "
			end
		end
	end
	local FinalText = ProcessedText .. BypassText
	OutputTextBox.Text = FinalText
	return FinalText
end
local function ProcessChatMessage(_)
	local ChatMessage = ParseChatText()
	if not IsBypassActive then
		pcall(function()
			SendBypassMessages()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
				:FireServer(ChatMessage, "All")
			task.wait(1)
			SendBypassMessages()
		end)
		pcall(function()
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(ChatMessage)
		end)
	end
end
InputTextBox.FocusLost:Connect(function(EnterPressed)
	if EnterPressed then
		ProcessChatMessage(InputTextBox.Text)
	end
end)
SendButton.MouseButton1Click:Connect(function()
	ProcessChatMessage(InputTextBox.Text)
end)
local function ToggleGuiVisibility()
	ChatBypassGui.Enabled = not ChatBypassGui.Enabled
end
UserInputService.InputBegan:Connect(function(InputObject, IsProcessed)
	if not IsProcessed and InputObject.KeyCode == Enum.KeyCode.RightControl then
		ToggleGuiVisibility()
	end
end)
UserInputService.InputBegan:Connect(function(KeyInput, IsInputProcessed)
	if
		not IsInputProcessed and (KeyInput.KeyCode == Enum.KeyCode.Slash or KeyInput.KeyCode == Enum.KeyCode.BackSlash)
	then
		wait(0)
		InputTextBox.Text = ""
		InputTextBox:CaptureFocus()
	end
end)
