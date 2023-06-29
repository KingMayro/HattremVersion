	db DEX_SKITTY ; pokedex id

	db  50,  45,  45,  50,  35
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 190 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/skitty.pic", 0, 1 ; sprite dimensions
	dw SkittyPicFront, SkittyPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWIFT,        REFLECT,      THUNDER_WAVE, REST,         SURF,         \
	     METRONOME,    SUBSTITUTE,   PSYCHIC_M,    FLASH                       \
	; end

	db BANK(SkittyPicFront)
	assert BANK(SkittyPicFront) == BANK(SkittyPicBack)
