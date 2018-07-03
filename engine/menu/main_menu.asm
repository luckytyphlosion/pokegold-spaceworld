INCLUDE "constants.asm"

SECTION "Main Menu", ROMX[$53CC], BANK[$01]

MainMenu:: ; 01:53CC
	ld hl, wd4a9 
	res 0, [hl]
	call ClearTileMap
	call GetMemSGBLayout
	call LoadFontExtra
	call LoadFont
	call ClearWindowData
	call Function5388
	ld hl, wce60
	bit 0, [hl]
	jr nz, .setMenuContinue
	xor a
	jr .skip
.setMenuContinue
	ld a, M_CONTINUE
.skip
	ldh a, [hJoyState]
	and D_DOWN | B_BUTTON | A_BUTTON
	cp D_DOWN | B_BUTTON | A_BUTTON
	jr nz, .setMenuPlay
	ld a, M_SET_TIME
	jr .triggerMenu
.setMenuPlay
	ld a, M_PLAY_GAME
.triggerMenu
	ld [wWhichIndexSet], a
	ld hl, MainMenuHeader
	call LoadMenuHeader
	call OpenMenu
	call CloseWindow
	jp c, TitleSequenceStart
	ld hl, MainMenuJumptable
	ld a, [wMenuSelection]
	jp CallJumptable

MainMenuHeader: ; 01:5418
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 13, 7
	dw .MenuData
	db 1 ; default option

.MenuData: ; 01:5420
	db $80
	db 0 ; items
	dw MainMenuItems
	db $8a, $1f
	dw .Strings

.Strings: ; 01:5428
	db "つづきから　はじめる@"
	db "さいしょから　はじめる@"
	db "せっていを　かえる@"
	db "#を　あそぶ@"
	db "じかんセット@"

MainMenuJumptable: ; 01:5457
	dw MainMenuOptionContinue
	dw StartNewGame
	dw MenuCallSettings
	dw StartNewGame
	dw MainMenuOptionSetTime

MainMenuItems:

NewGameMenu:
	db 2
	db NEW_GAME
	db OPTION
	db -1

ContinueMenu:
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db -1

PlayPokemonMenu:
	db 2
	db PLAY_POKEMON
	db OPTION
	db -1

PlayPokemonSetTimeMenu:
	db 3
	db PLAY_POKEMON
	db OPTION
	db SET_TIME
	db -1

MainMenuOptionSetTime:: ; 5473
	callab SetTime
	ret

MainMenuOptionContinue:: ;547C
	callab Function14624
	call DisplayContinueGameInfo
.loop
	call ClearJoypad
	call GetJoypad
	ldh a, [hJoyState]
	bit A_BUTTON_F, a
	jr nz, .escape
	bit B_BUTTON_F, a
	jp nz, MainMenu
	jr .loop
.escape
	call Function5397
	call Function53b0
	ld hl, wDebugFlags
	res DEBUG_FIELD_F, [hl]
	set CONTINUED_F, [hl]
	set 3, [hl]
	ldh a, [hJoyState]
	bit SELECT_F, a
	jr z, .skip
	set 1, [hl]
.skip
	call ClearBGPalettes
	call ClearTileMap
	ld c, $0A
	call DelayFrames
	jp OverworldStart

DisplayContinueGameInfo:: ; 54BF
	xor a
	ldh [hBGMapMode], a
	hlcoord 4, 7
	ld b, $08
	ld c, $0D
	call DrawTextBox
	hlcoord 5, 9
	ld de, PlayerInfoText
	call PlaceString
	hlcoord 13, 9
	ld de, wPlayerName
	call PlaceString
	hlcoord 14, 11
	call PrintNumBadges
	hlcoord 13, 13
	call PrintNumOwnedMons
	hlcoord 12, 15
	call PrintPlayTime
	ld a, $01
	ldh [hBGMapMode], a
	ld c, $1E
	call DelayFrames
	ret

PrintNumBadges:: ;54FA
	push hl
	ld hl, wd163 ; badges?
	ld b, $01
	call CountSetBits
	pop hl
	ld de, wCountSetBitsResult
	ld bc, $0102 ; flags and constants for this? 1 byte source, 2 digit display
	jp PrintNumber

PrintNumOwnedMons:: ; 550D
	push hl
	ld hl, wPokedexOwned
	ld b, $20 ; flag_array NUM_POKEMON?
	call CountSetBits
	pop hl
	ld de, wCountSetBitsResult
	ld bc, $0103 ; 1 byte, 3 digit
	jp PrintNumber

PrintPlayTime:: ; 5520
	ld de, hRTCHours
	ld bc, $0103 ; 1 byte, 3 digit
	call PrintNumber
	ld [hl], "："
	inc hl
	ld de, hRTCMinutes
	ld bc, $8102 ; PRINTNUM_LEADINGZEROS, 1 byte, 2 digit
	jp PrintNumber

PlayerInfoText:
	db   "しゅじんこう"
	next "もっているバッジ　　　　こ"
	next "#ずかん　　　　ひき"
	next "プレイじかん"
	text_end
	
StartNewGame:: ; 555C
	ld de, MUSIC_NONE
	call PlayMusic
	ld de, MUSIC_OAK_INTRO
	call PlayMusic
	call LoadFontExtra
	xor a
	ldh [hBGMapMode], a
	callba Function52f9
	call ClearTileMap
	call ClearWindowData
	xor a
	ldh [hMapAnims], a
	ld a, [wDebugFlags]
	bit DEBUG_FIELD_F, a
	jp z, DemoStart
	call DebugSetUpPlayer
	jp IntroCleanup
	
; 558D
