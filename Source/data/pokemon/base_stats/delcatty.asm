	db DEX_DELCATTY ; pokedex id

	db  70,  65,  65,  70,  55
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/delcatty.pic", 0, 1 ; sprite dimensions
	dw DelcattyPicFront, DelcattyPicBack

	db HAT_TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWIFT,        REFLECT,      THUNDER_WAVE, REST,         SURF,         \
	     METRONOME,    SUBSTITUTE,   PSYCHIC_M,    FLASH                       \
	; end

	db BANK(DelcattyPicFront)
	assert BANK(DelcattyPicFront) == BANK(DelcattyPicBack)
