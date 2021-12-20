function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'template Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_test_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.23'); --Default value is: 0.23, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.23'); --Default value is: 0.23, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteData == 0 and noteType == 'template Note' then
		characterPlayAnim('boyfriend', 'shootLEFT', true);
			setProperty('boyfriend.specialAnim', true)
	elseif noteData == 1 and noteType == 'template Note' then
		characterPlayAnim('boyfriend', 'shootDOWN', true);
			setProperty('boyfriend.specialAnim', true)
	elseif noteData == 2 and noteType == 'template Note' then
		characterPlayAnim('boyfriend', 'shootUP', true);
			setProperty('boyfriend.specialAnim', true)
	elseif noteData == 3 and noteType == 'template Note' then
		characterPlayAnim('boyfriend', 'shootRIGHT', true);
			setProperty('boyfriend.specialAnim', true)
	end
	if noteType == 'template Note' then
		cameraShake('game', '0.03', '0.05');
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'template Note' then
		-- put something here if you want
	end
end