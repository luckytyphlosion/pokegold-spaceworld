INCLUDE "constants.asm"

SECTION "VRAM", VRAM[$8000], BANK[$00] ; Get around a RGBLINK bug. Remove this when it doesn't yield an error about fixing the section

UNION

vChars0:: ; 8000
	ds $80 tiles

vChars1:: ; 8800
	ds $80 tiles

vChars2:: ; 9000
	ds $80 tiles

NEXTU

; Battle/menu
vSprites:: ; 8000
	ds $80 tiles

vFont:: ; 8800
	ds $80 tiles

vFrontPic:: ; 9000
	ds 7 * 7 tiles

NEXTU

vNPCSprites:: ; 8000
	ds $80 tiles

vNPCSprites2:: ; 8800
	ds $80 tiles

vTileset:: ; 9000
;	ds $60 tiles
	ds $20 tiles

vExteriorTileset:: ; 9200
	ds $40 tiles
vTilesetEnd:: ; 9600

NEXTU

	ds $80 tiles

vTitleLogo:: ; 8800
	ds $80 tiles

;vFrontPic:: ; 9000
	ds 7 * 7 tiles

vTitleLogo2:: ; 9310
	; TODO: what size?

ENDU


vBGMap0:: ; 9800
	ds BG_MAP_WIDTH * BG_MAP_HEIGHT

vBGMap1:: ; 9c00
	ds BG_MAP_WIDTH * BG_MAP_HEIGHT