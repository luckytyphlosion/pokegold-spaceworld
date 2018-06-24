; collision IDs are built like this:
; 76543210
; \__/|\_/
;   | | \-- SubType
;   | \---- Flag
;   \------ Type
;
; What exactly flag means or if it
; means anything is up to Type.
; Old Types:
; ???
; New Types:
; 0 - Regular            8 - ???
; 1 - Trees, Grass etc.  9 - Special Talk Action
; 2 - Water              A - Jump Action
; 3 - Water 2            B - unused
; 4 - Land               C - unused
; 5 - Land 2             D - unused
; 6 - ???                E - unused
; 7 - Warps              F - unused

COLLISION_TYPE_MASK          EQU $f0
COLLISION_SUBTYPE_MASK       EQU $07
COLLISION_WATER_SUBTYPE_MASK EQU $03

COLLISION_FLAG EQU $08

; old collision constants

OLD_COLLISION_TYPE_REGULAR EQU $00
OLD_COLLISION_TYPE_SCENERY EQU $10
OLD_COLLISION_TYPE_WATER   EQU $20
OLD_COLLISION_TYPE_WATER2  EQU $40

OLD_COLLISION_WALKABLE EQU $00
OLD_COLLISION_SOLID    EQU $01
OLD_COLLISION_FLOOR    EQU $03
OLD_COLLISION_WALL     EQU $04

OLD_COLLISION_LEDGE    EQU $11

OLD_COLLISION_WATER2_S EQU $40

OLD_COLLISION_ROCK EQU $51

OLD_COLLISION_CARPED EQU $60
OLD_COLLISION_DOOR   EQU $61

OLD_COLLISION_SIGNPOST  EQU $70
OLD_COLLISION_SHOP_SIGN EQU $71
OLD_COLLISION_MART_ITEM EQU $72
OLD_COLLISION_COUNTER   EQU $73

OLD_COLLISION_CUT_TREE EQU $80
OLD_COLLISION_GRASS    EQU $82

; new collision constants

COLLISION_TYPE_REGULAR EQU $00
COLLISION_TYPE_SCENERY EQU $10
COLLISION_TYPE_WATER   EQU $20
COLLISION_TYPE_WATER2  EQU $30
COLLISION_TYPE_LAND    EQU $40
COLLISION_TYPE_LAND2   EQU $50
COLLISION_TYPE_UNK     EQU $60
COLLISION_TYPE_WARPS   EQU $70
COLLISION_TYPE_UNKN2   EQU $80
COLLISION_TYPE_SPECIAL EQU $90
COLLISION_TYPE_JUMP    EQU $A0

COLLISION_WALKABLE EQU $00
COLLISION_SOLID    EQU $07
COLLISION_CUT_TREE EQU $12
COLLISION_GRASS    EQU $18

; water collisions

COLLISION_WATER       EQU $21
COLLISION_WATERFALL   EQU $22
COLLISION_WATER_SOLID EQU $27

; water collisions 2
COLLISION_WATER2_E EQU $30
COLLISION_WATER2_W EQU $31
COLLISION_WATER2_N EQU $32
COLLISION_WATER2_S EQU $33
; $34..$37 will behave like COLLISION_WATER2_E..COLLISION_WATER2_S

; land collisions
COLLISION_LAND_SLOW EQU $40
COLLISION_LAND_E    EQU $41
COLLISION_LAND_W    EQU $42
COLLISION_LAND_N    EQU $43
COLLISION_LAND_S    EQU $44
; $45..$47 will behave like COLLISION_LAND_E

; land collisions 2
COLLISION_LAND2_E EQU $50
COLLISION_LAND2_W EQU $51
COLLISION_LAND2_N EQU $52
COLLISION_LAND2_S EQU $53
; $54..$57 will behave like COLLISION_LAND2_E


; warp collisions
COLLISION_CARPET   EQU $70
COLLISION_DOOR     EQU $71
COLLISION_STEPS    EQU $72

; special collisions
COLLISION_COUNTER           EQU $90
COLLISION_BOOKCASE          EQU $91
COLLISION_PC                EQU $93
COLLISION_RADIO             EQU $94
COLLISION_SIGNPOST          EQU $95
COLLISION_STRAIGHT_SIGNPOST EQU $97

; jump collisions
; perform jump in marked direction, else
; regular walking
COLLISION_JUMP_E  EQU $a0
COLLISION_JUMP_W  EQU $a1
COLLISION_JUMP_N  EQU $a2
COLLISION_JUMP_S  EQU $a3
COLLISION_JUMP_SE EQU $a4
COLLISION_JUMP_SW EQU $a5
COLLISION_JUMP_NE EQU $a6
COLLISION_JUMP_NW EQU $a7
