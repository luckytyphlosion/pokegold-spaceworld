INCLUDE "constants.asm"

SECTION "Audio", ROMX[$4000], BANK[$3A]

_DisableAudio:: ; 3a:4000
	push hl
	push de
	push bc
	push af
	ld hl, rNR50
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld hl, rNR10
	ld e, 4
.init_channel
	xor a
	ld [hli], a
	ld [hli], a
	ld a, 8
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $80
	ld [hli], a
	dec e
	jr nz, .init_channel

	ld hl, wMusic
	ld de, wMusicInitEnd - wMusic
.clear
	xor a
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .clear

	ld a, $77
	ld [wVolume], a

	pop af
	pop bc
	pop de
	pop hl
	ret

_UpdateSound:: ; 3a:4037
; Called once per frame
	xor a
	ld [wCurChannel], a
	ld [wSoundOutput], a
	ld bc, wChannel1

.loop
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .nextchannel

	call UpdateChannel

.nextchannel
	; Next channel
	ld hl, CHANNEL_STRUCT_LENGTH
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wCurChannel]
	inc a
	ld [wCurChannel], a
	cp NUM_CHANNELS
	jr nz, .loop

	call Functione82f0
	ret

UpdateChannel: ; 3a:4061
	; Get the note's duration
	ld hl, CHANNEL_NOTE_DURATION
	add hl, bc
	ld a, [hl]

	; Check if this is the last frame
	cp 1
	jr z, .noteover
	and a
	jr z, .noteover

	dec [hl]
	jr .continue_sound_update

.noteover
	call DisablePitchWheel
	call Functione884f

.continue_sound_update
	call Functione80b6
	ret

DisablePitchWheel: ; 3a:4061
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	res SOUND_PITCH_WHEEL, [hl]
	ret

Unreferenced_Functione8081: ; 3a:4081
	ld a, [wMapMusic]
	bit 0, a
	jr nz, .disable_music

	bit 1, a
	jr nz, .disable_sfx

.fail
	and a
	ret

.disable_music
	call _DisableAudio
	jr .done

.disable_sfx
	call IsChannelSFXOn
	jr c, .fail

	; Clear the registers of the channel
	call GetChannelRegisters
	ld e, rNR20 - rNR10
	xor a

.clear_loop
	ld [hli], a
	dec e
	jr nz, .clear_loop

.done
	scf
	ret

GetChannelRegisters: ; 3a:40a4
	ld a, [wCurChannel]
	ld e, a
	ld d, $00
	ld hl, .registers
	add hl, de
	ld l, [hl]
	ld h, $ff ; HIGH(rNR10, rNR20, rNR30, rNR40)
	ret

.registers
	db LOW(rNR10), LOW(rNR20), LOW(rNR30), LOW(rNR40)

Functione80b6: ; 3a:40b6
	ld hl, CHANNEL_DUTY_CYCLE
	add hl, bc
	ld a, [hl]
	ld [wCurTrackDuty], a

	ld hl, CHANNEL_INTENSITY
	add hl, bc
	ld a, [hl]
	ld [wCurTrackIntensity], a

	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld a, [hli]
	ld [wCurTrackFrequency], a
	ld a, [hl]
	ld [wCurTrackFrequency + 1], a
	ld a, $3f
	ld [wc195], a
	call Functione85d8
	call Functione87f9
	call Functione8839
	call IsChannelSFXOn
	jr nc, .end

	call Functione80fa
	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld a, [wSoundOutput]
	or [hl]
	ld [wSoundOutput], a

.end
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	xor a
	ld [hl], a
	ret

Functione80fa: ; 3a:40fa
	ld hl, .jumptable
	ld a, [wCurChannel]
	maskbits NUM_CHANNELS
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.jumptable
	; TODO

SECTION "IsChannelSFXOn", ROMX[$42bd], BANK[$3a]
IsChannelSFXOn: ; 3a:42bd
	; If it's not a valid channel, return
	ld a, [wCurChannel]
	cp NUM_MUSIC_CHANS
	jr nc, .off

	; Check if the corresponding SFX channel is on
	ld hl, CHANNEL_STRUCT_LENGTH * NUM_MUSIC_CHANS + CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .off

	and a
	ret

.off
	scf
	ret

IsAnySFXOn: ; 3a:42d0
	ld hl, wChannel5Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .on
	ld hl, wChannel6Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .on
	ld hl, wChannel7Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .on
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .on

	and a
	ret

.on
	scf
	ret

SECTION "Functione82f0", ROMX[$42f0], BANK[$3a]
Functione82f0: ; 3a:42f0
	call IncrementTempo
	call PlayDanger
	call FadeMusic
	call Functione841d
	ld a, [wVolume]
	ld [rNR50], a
	ld a, [wSoundOutput]
	ld [rNR51], a
	ret

PlayDanger: ; 3a:4307
	ld a, [wLowHealthAlarm]
	bit DANGER_ON_F, a
	ret z

	; Don't do anything if SFX is being played
	and $ff ^ (1 << DANGER_ON_F)
	ld d, a
	call IsAnySFXOn
	jr c, .increment

	; Play the high tone
	and a
	jr z, .begin

	; Play the low tone
	cp 16
	jr z, .halfway

	jr .increment

.halfway
	ld hl, DangerSoundLow
	jr .applychannel

.begin
	ld hl, DangerSoundHigh

.applychannel
	xor a
	ld [rNR10], a
	ld a, [hli]
	ld [rNR11], a
	ld a, [hli]
	ld [rNR12], a
	ld a, [hli]
	ld [rNR13], a
	ld a, [hli]
	ld [rNR14], a

.increment
	ld a, d
	inc a
	cp 30 ; Ending frame
	jr c, .noreset
	xor a
.noreset
	; Make sure the danger sound is kept on
	or 1 << DANGER_ON_F
	ld [wLowHealthAlarm], a

	; Make sure channel 1 is on
	ld a, [wSoundOutput]
	or $11
	ld [wSoundOutput], a
	ret

DangerSoundHigh: ; 3a:434a
	db $80 ; duty 50%
	db $e2 ; volume 14, envelope decrease sweep 2
	db $50 ; frequency: $750
	db $87 ; restart sound

DangerSoundLow: ; 3a:434e
	db $80 ; duty 50%
	db $e2 ; volume 14, envelope decrease sweep 2
	db $ee ; frequency: $6ee
	db $86 ; restart sound

IncrementTempo: ; 3a:4352
	call IsAnyChannelOn
	ret c

	ld a, [wIncrementTempo]
	ld e, a
	ld a, [wIncrementTempo + 1]
	ld d, a
	or e
	ret z

	ld hl, wChannel1Tempo
	call .addtempo
	ld hl, wChannel2Tempo
	call .addtempo
	ld hl, wChannel3Tempo
	call .addtempo
	ld hl, wChannel4Tempo
	call .addtempo
	xor a
	ld [wIncrementTempo], a
	ld [wIncrementTempo + 1], a
	ret

.addtempo
	; (int16)[hl] += de
	push de
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ret

IsAnyChannelOn: ; 3a:438e
; Check if any music channel is on and isn't on the last frame

	ld hl, wChannel1Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .check_channel2

	ld hl, wChannel1NoteDuration
	ld a, [hl]
	cp 1
	jr nz, .on

.check_channel2
	ld hl, wChannel2Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .check_channel3

	ld hl, wChannel2NoteDuration
	ld a, [hl]
	cp 1
	jr nz, .on

.check_channel3
	ld hl, wChannel3Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .check_channel4

	ld hl, wChannel3NoteDuration
	ld a, [hl]
	cp 1
	jr nz, .on

.check_channel4
	ld hl, wChannel4Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .off

	ld hl, wChannel4NoteDuration
	ld a, [hl]
	cp 1
	jr nz, .on

.off
	and a
	ret

.on
	scf
	ret

FadeMusic: ; 3a:43ce
; Fade music if applicable
; usage:
;	write to wMusicFade
;	song fades out at the given rate
;	load song id in wMusicFadeID
;	fade new song in
; notes:
;	max # frames per volume level is $7f

	; Exit early if not fading
	ld a, [wMusicFade]
	and a
	ret z

	; If it doesn't have a count, assign it
	ld a, [wMusicFadeCount]
	and a
	jr z, .update

	; Count down
	dec a
	ld [wMusicFadeCount], a
	ret

.update
	ld a, [wMusicFade]
	ld d, a

	; Get new count
	and $7f
	ld [wMusicFadeCount], a

	; Get SO1 volume
	ld a, [wVolume]
	and VOLUME_SO1_LEVEL

	; Which way are we fading?
	bit MUSIC_FADE_IN_F, d
	jr nz, .fadein

	; Decrement volume
	and a
	jr z, .novolume
	dec a
	jr .updatevolume

.novolume
	; Fade in new song
	ld a, [wMusicFadeID]
	ld e, a
	ld a, [wMusicFadeID + 1]
	ld d, a
	push bc
	call _PlayMusic
	pop bc
	ld hl, wMusicFade
	set 7, [hl]
	ret

.fadein
	; Increment volume
	cp MAX_VOLUME & $f
	jr nc, .maxvolume
	inc a
	jr .updatevolume

.maxvolume
	; Clear wMusicFade
	xor a
	ld [wMusicFade], a
	ret

.updatevolume
	; Set the current volume for both speakers
	ld d, a
	swap a
	or d
	ld [wVolume], a
	ret

SECTION "Audio engine, part 2", ROMX[$4CEE], BANK[$3A] ; TODO: disassemble what's above (gulp) and remove this

SetGlobalTempo: ; 3a:4cee
	push bc
	ld a, [wCurChannel]
	cp CHAN5
	jr nc, .sfxchannels
	ld bc, wChannel1
	call Tempo
	ld bc, wChannel2
	call Tempo
	ld bc, wChannel3
	call Tempo
	ld bc, wChannel4
	call Tempo
	jr .end

.sfxchannels
	ld bc, wChannel5
	call Tempo
	ld bc, wChannel6
	call Tempo
	ld bc, wChannel7
	call Tempo
	ld bc, wChannel8
	call Tempo

.end
	pop bc
	ret

Tempo: ; 3a:4d2a
	ld hl, CHANNEL_TEMPO
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld hl, CHANNEL_FIELD16
	add hl, bc
	ld [hl], a
	ret


StartChannel: ; 3a:4d38
	call SetLRTracks
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_CHANNEL_ON, [hl]
	ret


StopChannel: ; 3a:4d42
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	res SOUND_CHANNEL_ON, [hl]
	ld hl, CHANNEL_MUSIC_ID
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret


SetLRTracks: ; 3a:4d51
	push de
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	ld e, a
	ld d, 0
	ld hl, $52B3 ; FIXME
	add hl, de
	ld a, [hl]
	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld [hl], a
	pop de
	ret


_PlayMusic:: ; 3a:4d66
	ld hl, wMusicID
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, Music
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld [wMusicBank], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	call LoadMusicByte
	rlca
	rlca
	maskbits NUM_MUSIC_CHANS
	inc a
.loop
	push af
	call LoadChannel
	call StartChannel
	pop af
	dec a
	jr nz, .loop
	xor a
	; TODO

SECTION "Song Header Pointers", ROMX[$52C7], BANK[$3A]
INCLUDE "audio/song_header_pointers.inc"
