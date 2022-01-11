
;*************************************************
;*          RULES - MIDI FILTERS
;*************************************************

/* 
    The MidiRules section is for mapping MIDI input to actions.
    Alter these functions as required.
*/

ProcessNote(device, channel, note, velocity, isNoteOn) {

}

prev14 = -1
last14 = -1
prev15 = -1
last15 = -1

ProcessCC(device, channel, cc, value) {
	global prev14, last14
	global prev15, last15
	SetKeyDelay 10, 40
    if (cc = 15) {
		if (last15 == -1) {
			prev15 := value
			last15 := value
			return
		}
		prev15 := last15
		last15 := value
		if (last15 > prev15 or value == 127) {
			loop % last15-prev15 {
				DisplayOutput("TRIM2", "}")
			}
		} else if (last15 < prev15 or value == 0) {
			loop % prev15-last15 {
				DisplayOutput("TRIM2", "{")
			}
		}
    } else if (cc = 14) {
		if (last14 == -1) {
			prev14 := value
			last14 := value
			return
		}
		prev14 := last14
		last14 := value
		if (last14 > prev14 or value == 127) {
			loop % last14-prev14 {
				DisplayOutput("TRIM1", "]")
			}
		} else if (last14 < prev14 or value == 0) {
			loop % prev14-last14 {
				DisplayOutput("TRIM1", "[")
			}
		}
    }
	
}

ProcessPC(device, channel, note, velocity) {
    
}

ProcessPitchBend(device, channel, value) {
    
}

