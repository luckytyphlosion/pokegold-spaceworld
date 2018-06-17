INCLUDE "constants.asm"

SECTION "Debug Menu", ROMX[$4031], BANK[$01]

DebugMenu:: ; $4031
call ClearTileMap
call ClearWindowData
call LoadFont
call LoadFontsBattleExtra
call ClearSprites
call GetMemSGBLayout
xor a
ld [wWhichIndexSet], a
ld hl, DebugMenuData
call LoadMenuHeader
call OpenMenu
call CloseWindow
jp c, TitleSequenceStart
ld a, $41
ld [wce5f], a
ld a, [wMenuSelection]
ld hl, DebugJumpTable1
jp CallJumptable

DebugJumpTable1:: ; 4064
	dw DebugMenuOptionFight
	dw DebugMenuOptionField
	dw Function094c ; sound test
	dw DebugMenuOptionSubGames
	dw DebugMenuOptionMonsterTest
	dw DebugMenuOptionName
	
DebugMenuData: ; 4070
	db MENU_BACKUP_TILES ; flags
	menu_coords 05, 02, SCREEN_WIDTH - 7, SCREEN_HEIGHT - 1
	dw .MenuData
	db 01 ; default option

.MenuData: ; 4078
	db $A0 
	db 0 ; items
	dw $40A0
	db $8A, $1F 
	dw .Strings
	
.Strings
	db "ファイト@"
	db "フィールド@"
	db "サウンド@"
	db "サブゲーム@"
	db "モンスター@"
	db "なまえ@"
	
DebugMenuItems:
	db 06 
	db 00 
	db 01 
	db 02 
	db 03 
	db 04 
	db 05 
	db -1

DebugMenuOptionField:: ; 40A8
	ld hl, wce63
	set 1, [hl] ; set debug mode
	jp Function555C
	
DebugMenuOptionFight:: ; 40B0
	ld hl, wce63
	set 0, [hl]
	ld a, $54
	call Predef
	ld hl, wce63
	res 0, [hl]
	ret

DebugMenuOptionSubGames:: ; 40C0
	callab CallSubGameMenu
	jp DebugMenu

DebugMenuOptionMonsterTest:: ; 40CB
	ld hl, wPokedexOwned
	ld de, wPokedexSeen
	ld b, $1F
	ld a, $FF
.loop
	ld [hl+], a
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ld a, $03
	ld [hl], a
	ld [de], a
	callab MonsterTest
	ld a, $e4
	ldh [rBGP], a
	
Function40eb::
	jp DebugMenu

DebugMenuOptionName:: ; 40EE
	callab OpenPokegear
	ld a, $e4
	ldh [rBGP], a
	jp DebugMenu
	
; 40FD