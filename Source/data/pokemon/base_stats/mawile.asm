	db DEX_MAWILE ; pokedex id

	db  50,  85,  85,  50,  55
	;   hp  atk  def  spd  spc

	db STEEL, FAIRY ; type
	db 190 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/mawile.pic", 0, 1 ; sprite dimensions
	dw MawilePicFront, MawilePicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWIFT,        REFLECT,      THUNDER_WAVE, REST,         SURF,         \
	     METRONOME,    SUBSTITUTE,   PSYCHIC_M,    FLASH                       \
	; end

	db BANK(MawilePicFront)
	assert BANK(MawilePicFront) == BANK(MawilePicBack)
