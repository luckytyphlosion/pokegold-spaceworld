INCLUDE "constants.asm"

SECTION "Type Matchups", ROMX[$506D], BANK[$0D]

TypeMatchups: ; 3506d
	;  attacker,  defender,  *=
	db TYPE_NORMAL,   TYPE_ROCK,     NOT_VERY_EFFECTIVE
	db TYPE_NORMAL,   TYPE_DARK,     SUPER_EFFECTIVE
	db TYPE_FIRE,     TYPE_FIRE,     NOT_VERY_EFFECTIVE
	db TYPE_FIRE,     TYPE_WATER,    NOT_VERY_EFFECTIVE
	db TYPE_FIRE,     TYPE_GRASS,    SUPER_EFFECTIVE
	db TYPE_FIRE,     TYPE_ICE,      SUPER_EFFECTIVE
	db TYPE_FIRE,     TYPE_BUG,      SUPER_EFFECTIVE
	db TYPE_FIRE,     TYPE_ROCK,     NOT_VERY_EFFECTIVE
	db TYPE_FIRE,     TYPE_DRAGON,   NOT_VERY_EFFECTIVE
	db TYPE_WATER,    TYPE_FIRE,     SUPER_EFFECTIVE
	db TYPE_WATER,    TYPE_WATER,    NOT_VERY_EFFECTIVE
	db TYPE_WATER,    TYPE_ELECTRIC, NOT_VERY_EFFECTIVE
	db TYPE_WATER,    TYPE_GRASS,    NOT_VERY_EFFECTIVE
	db TYPE_WATER,    TYPE_GROUND,   SUPER_EFFECTIVE
	db TYPE_WATER,    TYPE_ROCK,     SUPER_EFFECTIVE
	db TYPE_WATER,    TYPE_DRAGON,   NOT_VERY_EFFECTIVE
	db TYPE_WATER,    TYPE_METAL,    SUPER_EFFECTIVE
	db TYPE_ELECTRIC, TYPE_WATER,    SUPER_EFFECTIVE
	db TYPE_ELECTRIC, TYPE_ELECTRIC, NOT_VERY_EFFECTIVE
	db TYPE_ELECTRIC, TYPE_GRASS,    NOT_VERY_EFFECTIVE
	db TYPE_ELECTRIC, TYPE_GROUND,   NO_EFFECT
	db TYPE_ELECTRIC, TYPE_FLYING,   SUPER_EFFECTIVE
	db TYPE_ELECTRIC, TYPE_DRAGON,   NOT_VERY_EFFECTIVE
	db TYPE_ELECTRIC, TYPE_METAL,    SUPER_EFFECTIVE
	db TYPE_GRASS,    TYPE_FIRE,     NOT_VERY_EFFECTIVE
	db TYPE_GRASS,    TYPE_WATER,    SUPER_EFFECTIVE
	db TYPE_GRASS,    TYPE_GRASS,    NOT_VERY_EFFECTIVE
	db TYPE_GRASS,    TYPE_POISON,   NOT_VERY_EFFECTIVE
	db TYPE_GRASS,    TYPE_GROUND,   SUPER_EFFECTIVE
	db TYPE_GRASS,    TYPE_FLYING,   NOT_VERY_EFFECTIVE
	db TYPE_GRASS,    TYPE_BUG,      NOT_VERY_EFFECTIVE
	db TYPE_GRASS,    TYPE_ROCK,     SUPER_EFFECTIVE
	db TYPE_GRASS,    TYPE_DRAGON,   NOT_VERY_EFFECTIVE
	db TYPE_ICE,      TYPE_FIRE,     NOT_VERY_EFFECTIVE
	db TYPE_ICE,      TYPE_WATER,    NOT_VERY_EFFECTIVE
	db TYPE_ICE,      TYPE_GRASS,    SUPER_EFFECTIVE
	db TYPE_ICE,      TYPE_ICE,      NOT_VERY_EFFECTIVE
	db TYPE_ICE,      TYPE_GROUND,   SUPER_EFFECTIVE
	db TYPE_ICE,      TYPE_FLYING,   SUPER_EFFECTIVE
	db TYPE_ICE,      TYPE_DRAGON,   SUPER_EFFECTIVE
	db TYPE_FIGHTING, TYPE_NORMAL,   SUPER_EFFECTIVE
	db TYPE_FIGHTING, TYPE_ICE,      SUPER_EFFECTIVE
	db TYPE_FIGHTING, TYPE_POISON,   NOT_VERY_EFFECTIVE
	db TYPE_FIGHTING, TYPE_FLYING,   NOT_VERY_EFFECTIVE
	db TYPE_FIGHTING, TYPE_PSYCHIC,  NOT_VERY_EFFECTIVE
	db TYPE_FIGHTING, TYPE_BUG,      NOT_VERY_EFFECTIVE
	db TYPE_FIGHTING, TYPE_ROCK,     SUPER_EFFECTIVE
	db TYPE_FIGHTING, TYPE_GHOST,    NO_EFFECT
	db TYPE_FIGHTING, TYPE_METAL,    NOT_VERY_EFFECTIVE
	db TYPE_POISON,   TYPE_GRASS,    SUPER_EFFECTIVE
	db TYPE_POISON,   TYPE_POISON,   NOT_VERY_EFFECTIVE
	db TYPE_POISON,   TYPE_GROUND,   NOT_VERY_EFFECTIVE
	db TYPE_POISON,   TYPE_BUG,      SUPER_EFFECTIVE
	db TYPE_POISON,   TYPE_ROCK,     NOT_VERY_EFFECTIVE
	db TYPE_POISON,   TYPE_GHOST,    NOT_VERY_EFFECTIVE
	db TYPE_POISON,   TYPE_METAL,    NOT_VERY_EFFECTIVE
	db TYPE_GROUND,   TYPE_FIRE,     SUPER_EFFECTIVE
	db TYPE_GROUND,   TYPE_ELECTRIC, SUPER_EFFECTIVE
	db TYPE_GROUND,   TYPE_GRASS,    NOT_VERY_EFFECTIVE
	db TYPE_GROUND,   TYPE_POISON,   SUPER_EFFECTIVE
	db TYPE_GROUND,   TYPE_FLYING,   NO_EFFECT
	db TYPE_GROUND,   TYPE_BUG,      NOT_VERY_EFFECTIVE
	db TYPE_GROUND,   TYPE_ROCK,     SUPER_EFFECTIVE
	db TYPE_FLYING,   TYPE_ELECTRIC, NOT_VERY_EFFECTIVE
	db TYPE_FLYING,   TYPE_GRASS,    SUPER_EFFECTIVE
	db TYPE_FLYING,   TYPE_FIGHTING, SUPER_EFFECTIVE
	db TYPE_FLYING,   TYPE_BUG,      SUPER_EFFECTIVE
	db TYPE_FLYING,   TYPE_ROCK,     NOT_VERY_EFFECTIVE
	db TYPE_PSYCHIC,  TYPE_FIGHTING, SUPER_EFFECTIVE
	db TYPE_PSYCHIC,  TYPE_POISON,   SUPER_EFFECTIVE
	db TYPE_PSYCHIC,  TYPE_PSYCHIC,  NOT_VERY_EFFECTIVE
	db TYPE_PSYCHIC,  TYPE_DARK,     NOT_VERY_EFFECTIVE
	db TYPE_BUG,      TYPE_FIRE,     NOT_VERY_EFFECTIVE
	db TYPE_BUG,      TYPE_GRASS,    SUPER_EFFECTIVE
	db TYPE_BUG,      TYPE_FIGHTING, NOT_VERY_EFFECTIVE
	db TYPE_BUG,      TYPE_POISON,   SUPER_EFFECTIVE
	db TYPE_BUG,      TYPE_FLYING,   NOT_VERY_EFFECTIVE
	db TYPE_BUG,      TYPE_PSYCHIC,  SUPER_EFFECTIVE
	db TYPE_BUG,      TYPE_GHOST,    NOT_VERY_EFFECTIVE
	db TYPE_BUG,      TYPE_DARK,     SUPER_EFFECTIVE
	db TYPE_ROCK,     TYPE_FIRE,     SUPER_EFFECTIVE
	db TYPE_ROCK,     TYPE_ICE,      SUPER_EFFECTIVE
	db TYPE_ROCK,     TYPE_FIGHTING, NOT_VERY_EFFECTIVE
	db TYPE_ROCK,     TYPE_GROUND,   NOT_VERY_EFFECTIVE
	db TYPE_ROCK,     TYPE_FLYING,   SUPER_EFFECTIVE
	db TYPE_ROCK,     TYPE_BUG,      SUPER_EFFECTIVE
	db TYPE_ROCK,     TYPE_METAL,    NOT_VERY_EFFECTIVE
	db TYPE_GHOST,    TYPE_NORMAL,   NO_EFFECT
	db TYPE_GHOST,    TYPE_PSYCHIC,  SUPER_EFFECTIVE
	db TYPE_GHOST,    TYPE_DARK,     NOT_VERY_EFFECTIVE
	db TYPE_DRAGON,   TYPE_DRAGON,   SUPER_EFFECTIVE
	db TYPE_DARK,     TYPE_NORMAL,   NOT_VERY_EFFECTIVE
	db TYPE_DARK,     TYPE_PSYCHIC,  SUPER_EFFECTIVE
	db TYPE_DARK,     TYPE_GHOST,    SUPER_EFFECTIVE
	db TYPE_DARK,     TYPE_DARK,     SUPER_EFFECTIVE
	db TYPE_METAL,    TYPE_WATER,    NOT_VERY_EFFECTIVE
	db TYPE_METAL,    TYPE_ELECTRIC, NOT_VERY_EFFECTIVE
	db TYPE_METAL,    TYPE_ROCK,     SUPER_EFFECTIVE
	db TYPE_METAL,    TYPE_METAL,    NO_EFFECT

	db -2 ; end (with Foresight)

; Foresight removes Ghost's immunity to Normal
	db TYPE_NORMAL,  TYPE_GHOST,   NO_EFFECT

	db -1 ; end
; 3519b
