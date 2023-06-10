LoadYellowTitleScreenGFX:
	ld hl, PokemonLogoGraphics
	ld de, vChars2
	ld bc, PokemonLogoGraphicsEnd - PokemonLogoGraphics
	ld a, BANK(PokemonLogoGraphics)
	call FarCopyData
	ld hl, PokemonLogoCornerGraphics
	ld de, vChars1 tile $7d
	ld bc, PokemonLogoCornerGraphicsEnd - PokemonLogoCornerGraphics
	ld a, BANK(PokemonLogoCornerGraphics)
	call FarCopyData
	ld hl, TitlePikachuBGGraphics
	ld de, vChars1
	ld bc, TitlePikachuBGGraphicsEnd - TitlePikachuBGGraphics
	ld a, BANK(TitlePikachuBGGraphics)
	call FarCopyData
	ld hl, TitlePikachuOBGraphics
	ld de, vChars1 tile $70
	ld bc, TitlePikachuOBGraphicsEnd - TitlePikachuOBGraphics
	ld a, BANK(TitlePikachuOBGraphics)
	call FarCopyData
	ret

TitleScreen_PlacePokemonLogo:
	hlcoord 2, 0
	ld de, TitleScreenPokemonLogoTilemap
	lb bc, 7, 16
	call Bank3D_CopyBox
	ret

TitleScreen_PlacePikaSpeechBubble:
	hlcoord 6, 3
	ld de, TitleScreenPikaBubbleTilemap
	lb bc, 4, 7
	call Bank3D_CopyBox
	hlcoord 9, 7
	ld [hl], $64
	inc hl
	ld [hl], $65
;demo text
	hlcoord 17, 6
	ld [hl], $73
	hlcoord 18, 6
	ld [hl], $74
	hlcoord 19, 6
	ld [hl], $75

	ret

TitleScreen_PlacePikachu:
	hlcoord 4, 8
	ld de, TitleScreenPikachuTilemap
	lb bc, 9, 12
	call Bank3D_CopyBox	

; year and name
	hlcoord 2, 17
	ld [hl], $00
	hlcoord 3, 17
	ld [hl], $00
	hlcoord 4, 17
	ld [hl], $D1
	hlcoord 5, 17
	ld [hl], $C8
	hlcoord 6, 17
	ld [hl], $E1
	hlcoord 7, 17
	ld [hl], $E2
	hlcoord 16, 17
	ld [hl], $00
	hlcoord 17, 17
	ld [hl], $00

; circles

	hlcoord 18, 15
	ld [hl], $D2
	hlcoord 1, 8
	ld [hl], $DB
	hlcoord 16, 13
	ld [hl], $DA
	hlcoord 16, 12
	ld [hl], $D8
	hlcoord 17, 8
	ld [hl], $DC
	hlcoord 18, 8
	ld [hl], $DD
	hlcoord 19, 8
	ld [hl], $DE
	hlcoord 17, 9
	ld [hl], $DF
	hlcoord 17, 10
	ld [hl], $EF
	hlcoord 17, 11
	ld [hl], $EC
	hlcoord 18, 11
	ld [hl], $ED
	hlcoord 19, 11
	ld [hl], $C7
	hlcoord 3, 15
	ld [hl], $CF
	hlcoord 3, 14
	ld [hl], $CB
	hlcoord 3, 13
	ld [hl], $C9
	hlcoord 3, 12
	ld [hl], $E3
	hlcoord 2, 12
	ld [hl], $C6
	hlcoord 1, 12
	ld [hl], $C5
	hlcoord 0, 12
	ld [hl], $E0
	hlcoord 0, 13
	ld [hl], $E4
	hlcoord 0, 14
	ld [hl], $CA
	hlcoord 0, 15
	ld [hl], $CC
	hlcoord 1, 15
	ld [hl], $CD
	hlcoord 2, 15
	ld [hl], $CE
	hlcoord 3, 15
	ld [hl], $CF
	hlcoord 4, 15
	ld [hl], $CF

	ld [hl], $b1
	ld hl, TitleScreenPikachuEyesOAMData
	ld de, wShadowOAM
	ld bc, $20
	call CopyData
	ret

TitleScreenPikachuEyesOAMData:
	db $70, $46, $f1, $22
	db $70, $4E, $f0, $22
	db $78, $46, $f3, $22
	db $78, $4E, $f2, $22
	db $70, $5A, $f0, $02
	db $70, $62, $f1, $02
	db $78, $5A, $f2, $02
	db $78, $62, $f3, $02


Bank3D_CopyBox:
; copy cxb (xy) screen area from de to hl
.row
	push bc
	push hl
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

TitleScreenPokemonLogoTilemap: ; 16x7
	INCBIN "gfx/title/pokemon_logo.tilemap"

Pointer_f4669: ; unreferenced
	db $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $5f

TitleScreenPikaBubbleTilemap: ; 7x4
	INCBIN "gfx/title/pika_bubble.tilemap"

TitleScreenPikachuTilemap: ; 12x9
	INCBIN "gfx/title/pikachu.tilemap"

PokemonLogoGraphics: INCBIN "gfx/title/pokemon_logo.2bpp"
PokemonLogoGraphicsEnd:
PokemonLogoCornerGraphics: INCBIN "gfx/title/pokemon_logo_corner.2bpp"
PokemonLogoCornerGraphicsEnd:
TitlePikachuBGGraphics: INCBIN "gfx/title/pikachu_bg.2bpp"
TitlePikachuBGGraphicsEnd:
TitlePikachuOBGraphics: INCBIN "gfx/title/pikachu_ob.2bpp"
TitlePikachuOBGraphicsEnd:
