	db DEX_PIKACHU ; pokedex id

	db  57,  40,  65,  49,  79
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
	dw PikachuPicFront, PikachuPicBack

; For whatever reason, the game wants to add Scratch and Aurora Beam to the moveset,
; So instead of fixing it, I just moved Confusion (ironic) and Play Nice (also Ironic)
; to where Scratch and Aurora Beam were. So you have to swap out the moves (Confusion
; and Play Nice) if you want to change them in here. Sounds fun doesn't it?

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWIFT,        REFLECT,      THUNDER_WAVE, REST,        FLASH,         \
	     METRONOME,    SUBSTITUTE,   PSYCHIC_M,    SURF                        \
	; end

	db BANK(PikachuPicFront)
	assert BANK(PikachuPicFront) == BANK(PikachuPicBack)
