	db DEX_PIKACHU ; pokedex id

	db  57,  40,  65,  49,  79
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
	dw PikachuPicFront, PikachuPicBack

	db CONFUSION, PLAY_NICE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWIFT,        REFLECT,      THUNDER_WAVE, REST,        FLASH,         \
	     METRONOME,    SUBSTITUTE,   PSYCHIC_M                                 \
	; end

	db BANK(PikachuPicFront)
	assert BANK(PikachuPicFront) == BANK(PikachuPicBack)
