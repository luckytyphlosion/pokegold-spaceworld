INCLUDE "constants.asm"

SECTION "Base Data", ROMX[$4F10], BANK[$14]

tmhm: MACRO
; used in data/pokemon/base_stats/*.asm
tms1 = 0 ; TM01-TM24 (24)
tms2 = 0 ; TM25-TM48 (24)
tms3 = 0 ; TM49-TM50 + HM01-HM07 (9)
rept _NARG
	if 0 < \1 && \1 <= (NUM_TMS_HMS + 7) / 8 * 8
	if \1 < 24 + 1
tms1 = tms1 | (1 << ((\1) - 1))
	elif \1 < 48 + 1
tms2 = tms2 | (1 << ((\1) - 1 - 24))
	else
tms3 = tms3 | (1 << ((\1) - 1 - 48))
	endc
	else
		fail "\1 is not a TM/HM number"
	endc
	shift
endr
rept 3 ; TM01-TM24 (24/24)
	db tms1 & $ff
tms1 = tms1 >> 8
endr
rept 3 ; TM25-TM48 (24/24)
	db tms2 & $ff
tms2 = tms2 >> 8
endr
rept 2 ; TM49-TM50 + HM01-HM07 (9/16)
	db tms3 & $ff
tms3 = tms3 >> 8
endr
ENDM

BaseData::
MonBaseStats::
INCLUDE "data/pokemon/base_stats/fushigidane.inc"
MonBaseStatsEnd::
INCLUDE "data/pokemon/base_stats/fushigisou.inc"
INCLUDE "data/pokemon/base_stats/fushigibana.inc"
INCLUDE "data/pokemon/base_stats/hitokage.inc"
INCLUDE "data/pokemon/base_stats/lizardo.inc"
INCLUDE "data/pokemon/base_stats/lizardon.inc"
INCLUDE "data/pokemon/base_stats/zenigame.inc"
INCLUDE "data/pokemon/base_stats/kameil.inc"
INCLUDE "data/pokemon/base_stats/kamex.inc"
INCLUDE "data/pokemon/base_stats/caterpie.inc"
INCLUDE "data/pokemon/base_stats/transel.inc"
INCLUDE "data/pokemon/base_stats/butterfree.inc"
INCLUDE "data/pokemon/base_stats/beedle.inc"
INCLUDE "data/pokemon/base_stats/cocoon.inc"
INCLUDE "data/pokemon/base_stats/spear.inc"
INCLUDE "data/pokemon/base_stats/poppo.inc"
INCLUDE "data/pokemon/base_stats/pigeon.inc"
INCLUDE "data/pokemon/base_stats/pigeot.inc"
INCLUDE "data/pokemon/base_stats/koratta.inc"
INCLUDE "data/pokemon/base_stats/ratta.inc"
INCLUDE "data/pokemon/base_stats/onisuzume.inc"
INCLUDE "data/pokemon/base_stats/onidrill.inc"
INCLUDE "data/pokemon/base_stats/arbo.inc"
INCLUDE "data/pokemon/base_stats/arbok.inc"
INCLUDE "data/pokemon/base_stats/pikachu.inc"
INCLUDE "data/pokemon/base_stats/raichu.inc"
INCLUDE "data/pokemon/base_stats/sand.inc"
INCLUDE "data/pokemon/base_stats/sandpan.inc"
INCLUDE "data/pokemon/base_stats/nidoran_f.inc"
INCLUDE "data/pokemon/base_stats/nidorina.inc"
INCLUDE "data/pokemon/base_stats/nidoqueen.inc"
INCLUDE "data/pokemon/base_stats/nidoran_m.inc"
INCLUDE "data/pokemon/base_stats/nidorino.inc"
INCLUDE "data/pokemon/base_stats/nidoking.inc"
INCLUDE "data/pokemon/base_stats/pippi.inc"
INCLUDE "data/pokemon/base_stats/pixy.inc"
INCLUDE "data/pokemon/base_stats/rokon.inc"
INCLUDE "data/pokemon/base_stats/kyukon.inc"
INCLUDE "data/pokemon/base_stats/purin.inc"
INCLUDE "data/pokemon/base_stats/pukurin.inc"
INCLUDE "data/pokemon/base_stats/zubat.inc"
INCLUDE "data/pokemon/base_stats/golbat.inc"
INCLUDE "data/pokemon/base_stats/nazonokusa.inc"
INCLUDE "data/pokemon/base_stats/kusaihana.inc"
INCLUDE "data/pokemon/base_stats/ruffresia.inc"
INCLUDE "data/pokemon/base_stats/paras.inc"
INCLUDE "data/pokemon/base_stats/parasect.inc"
INCLUDE "data/pokemon/base_stats/kongpang.inc"
INCLUDE "data/pokemon/base_stats/morphon.inc"
INCLUDE "data/pokemon/base_stats/digda.inc"
INCLUDE "data/pokemon/base_stats/dugtrio.inc"
INCLUDE "data/pokemon/base_stats/nyarth.inc"
INCLUDE "data/pokemon/base_stats/persian.inc"
INCLUDE "data/pokemon/base_stats/koduck.inc"
INCLUDE "data/pokemon/base_stats/golduck.inc"
INCLUDE "data/pokemon/base_stats/mankey.inc"
INCLUDE "data/pokemon/base_stats/okorizaru.inc"
INCLUDE "data/pokemon/base_stats/gardie.inc"
INCLUDE "data/pokemon/base_stats/windie.inc"
INCLUDE "data/pokemon/base_stats/nyoromo.inc"
INCLUDE "data/pokemon/base_stats/nyorozo.inc"
INCLUDE "data/pokemon/base_stats/nyorobon.inc"
INCLUDE "data/pokemon/base_stats/casey.inc"
INCLUDE "data/pokemon/base_stats/yungerer.inc"
INCLUDE "data/pokemon/base_stats/foodin.inc"
INCLUDE "data/pokemon/base_stats/wanriky.inc"
INCLUDE "data/pokemon/base_stats/goriky.inc"
INCLUDE "data/pokemon/base_stats/kairiky.inc"
INCLUDE "data/pokemon/base_stats/madatsubomi.inc"
INCLUDE "data/pokemon/base_stats/utsudon.inc"
INCLUDE "data/pokemon/base_stats/utsubot.inc"
INCLUDE "data/pokemon/base_stats/menokurage.inc"
INCLUDE "data/pokemon/base_stats/dokukurage.inc"
INCLUDE "data/pokemon/base_stats/isitsubute.inc"
INCLUDE "data/pokemon/base_stats/golone.inc"
INCLUDE "data/pokemon/base_stats/golonya.inc"
INCLUDE "data/pokemon/base_stats/ponyta.inc"
INCLUDE "data/pokemon/base_stats/gallop.inc"
INCLUDE "data/pokemon/base_stats/yadon.inc"
INCLUDE "data/pokemon/base_stats/yadoran.inc"
INCLUDE "data/pokemon/base_stats/coil.inc"
INCLUDE "data/pokemon/base_stats/rarecoil.inc"
INCLUDE "data/pokemon/base_stats/kamonegi.inc"
INCLUDE "data/pokemon/base_stats/dodo.inc"
INCLUDE "data/pokemon/base_stats/dodorio.inc"
INCLUDE "data/pokemon/base_stats/pawou.inc"
INCLUDE "data/pokemon/base_stats/jugon.inc"
INCLUDE "data/pokemon/base_stats/betbeter.inc"
INCLUDE "data/pokemon/base_stats/betbeton.inc"
INCLUDE "data/pokemon/base_stats/shellder.inc"
INCLUDE "data/pokemon/base_stats/parshen.inc"
INCLUDE "data/pokemon/base_stats/ghos.inc"
INCLUDE "data/pokemon/base_stats/ghost.inc"
INCLUDE "data/pokemon/base_stats/gangar.inc"
INCLUDE "data/pokemon/base_stats/iwark.inc"
INCLUDE "data/pokemon/base_stats/sleepe.inc"
INCLUDE "data/pokemon/base_stats/sleeper.inc"
INCLUDE "data/pokemon/base_stats/crab.inc"
INCLUDE "data/pokemon/base_stats/kingler.inc"
INCLUDE "data/pokemon/base_stats/biriridama.inc"
INCLUDE "data/pokemon/base_stats/marumine.inc"
INCLUDE "data/pokemon/base_stats/tamatama.inc"
INCLUDE "data/pokemon/base_stats/nassy.inc"
INCLUDE "data/pokemon/base_stats/karakara.inc"
INCLUDE "data/pokemon/base_stats/garagara.inc"
INCLUDE "data/pokemon/base_stats/sawamular.inc"
INCLUDE "data/pokemon/base_stats/ebiwalar.inc"
INCLUDE "data/pokemon/base_stats/beroringa.inc"
INCLUDE "data/pokemon/base_stats/dogars.inc"
INCLUDE "data/pokemon/base_stats/matadogas.inc"
INCLUDE "data/pokemon/base_stats/sihorn.inc"
INCLUDE "data/pokemon/base_stats/sidon.inc"
INCLUDE "data/pokemon/base_stats/lucky.inc"
INCLUDE "data/pokemon/base_stats/monjara.inc"
INCLUDE "data/pokemon/base_stats/garura.inc"
INCLUDE "data/pokemon/base_stats/tattu.inc"
INCLUDE "data/pokemon/base_stats/seadra.inc"
INCLUDE "data/pokemon/base_stats/tosakinto.inc"
INCLUDE "data/pokemon/base_stats/azumao.inc"
INCLUDE "data/pokemon/base_stats/hitodeman.inc"
INCLUDE "data/pokemon/base_stats/starmie.inc"
INCLUDE "data/pokemon/base_stats/barrierd.inc"
INCLUDE "data/pokemon/base_stats/strike.inc"
INCLUDE "data/pokemon/base_stats/rougela.inc"
INCLUDE "data/pokemon/base_stats/eleboo.inc"
INCLUDE "data/pokemon/base_stats/boober.inc"
INCLUDE "data/pokemon/base_stats/kailios.inc"
INCLUDE "data/pokemon/base_stats/kentauros.inc"
INCLUDE "data/pokemon/base_stats/koiking.inc"
INCLUDE "data/pokemon/base_stats/gyarados.inc"
INCLUDE "data/pokemon/base_stats/laplace.inc"
INCLUDE "data/pokemon/base_stats/metamon.inc"
INCLUDE "data/pokemon/base_stats/eievui.inc"
INCLUDE "data/pokemon/base_stats/showers.inc"
INCLUDE "data/pokemon/base_stats/thunders.inc"
INCLUDE "data/pokemon/base_stats/booster.inc"
INCLUDE "data/pokemon/base_stats/porygon.inc"
INCLUDE "data/pokemon/base_stats/omnite.inc"
INCLUDE "data/pokemon/base_stats/omstar.inc"
INCLUDE "data/pokemon/base_stats/kabuto.inc"
INCLUDE "data/pokemon/base_stats/kabutops.inc"
INCLUDE "data/pokemon/base_stats/ptera.inc"
INCLUDE "data/pokemon/base_stats/kabigon.inc"
INCLUDE "data/pokemon/base_stats/freezer.inc"
INCLUDE "data/pokemon/base_stats/thunder.inc"
INCLUDE "data/pokemon/base_stats/fire.inc"
INCLUDE "data/pokemon/base_stats/miniryu.inc"
INCLUDE "data/pokemon/base_stats/hakuryu.inc"
INCLUDE "data/pokemon/base_stats/kairyu.inc"
INCLUDE "data/pokemon/base_stats/mewtwo.inc"
INCLUDE "data/pokemon/base_stats/mew.inc"
INCLUDE "data/pokemon/base_stats/happa.inc"
INCLUDE "data/pokemon/base_stats/hanamogura.inc"
INCLUDE "data/pokemon/base_stats/hanaryu.inc"
INCLUDE "data/pokemon/base_stats/honoguma.inc"
INCLUDE "data/pokemon/base_stats/volbear.inc"
INCLUDE "data/pokemon/base_stats/dynabear.inc"
INCLUDE "data/pokemon/base_stats/kurusu.inc"
INCLUDE "data/pokemon/base_stats/aqua.inc"
INCLUDE "data/pokemon/base_stats/aquaria.inc"
INCLUDE "data/pokemon/base_stats/hoho.inc"
INCLUDE "data/pokemon/base_stats/bobo.inc"
INCLUDE "data/pokemon/base_stats/pachimee.inc"
INCLUDE "data/pokemon/base_stats/mokoko.inc"
INCLUDE "data/pokemon/base_stats/denryu.inc"
INCLUDE "data/pokemon/base_stats/mikon.inc"
INCLUDE "data/pokemon/base_stats/monja.inc"
INCLUDE "data/pokemon/base_stats/jaranra.inc"
INCLUDE "data/pokemon/base_stats/haneei.inc"
INCLUDE "data/pokemon/base_stats/puku.inc"
INCLUDE "data/pokemon/base_stats/shibirefugu.inc"
INCLUDE "data/pokemon/base_stats/pichu.inc"
INCLUDE "data/pokemon/base_stats/py.inc"
INCLUDE "data/pokemon/base_stats/pupurin.inc"
INCLUDE "data/pokemon/base_stats/mizuuo.inc"
INCLUDE "data/pokemon/base_stats/naty.inc"
INCLUDE "data/pokemon/base_stats/natio.inc"
INCLUDE "data/pokemon/base_stats/gyopin.inc"
INCLUDE "data/pokemon/base_stats/maril.inc"
INCLUDE "data/pokemon/base_stats/manbo1.inc"
INCLUDE "data/pokemon/base_stats/ikari.inc"
INCLUDE "data/pokemon/base_stats/grotess.inc"
INCLUDE "data/pokemon/base_stats/eksing.inc"
INCLUDE "data/pokemon/base_stats/para.inc"
INCLUDE "data/pokemon/base_stats/kokumo.inc"
INCLUDE "data/pokemon/base_stats/twohead.inc"
INCLUDE "data/pokemon/base_stats/yoroidori.inc"
INCLUDE "data/pokemon/base_stats/animon.inc"
INCLUDE "data/pokemon/base_stats/hinazu.inc"
INCLUDE "data/pokemon/base_stats/sunny.inc"
INCLUDE "data/pokemon/base_stats/paon.inc"
INCLUDE "data/pokemon/base_stats/donphan.inc"
INCLUDE "data/pokemon/base_stats/twinz.inc"
INCLUDE "data/pokemon/base_stats/kirinriki.inc"
INCLUDE "data/pokemon/base_stats/painter.inc"
INCLUDE "data/pokemon/base_stats/kounya.inc"
INCLUDE "data/pokemon/base_stats/rinrin.inc"
INCLUDE "data/pokemon/base_stats/berurun.inc"
INCLUDE "data/pokemon/base_stats/nyorotono.inc"
INCLUDE "data/pokemon/base_stats/yadoking.inc"
INCLUDE "data/pokemon/base_stats/annon.inc"
INCLUDE "data/pokemon/base_stats/rediba.inc"
INCLUDE "data/pokemon/base_stats/mitsuboshi.inc"
INCLUDE "data/pokemon/base_stats/puchicorn.inc"
INCLUDE "data/pokemon/base_stats/eifie.inc"
INCLUDE "data/pokemon/base_stats/blacky.inc"
INCLUDE "data/pokemon/base_stats/turban.inc"
INCLUDE "data/pokemon/base_stats/betbaby.inc"
INCLUDE "data/pokemon/base_stats/teppouo.inc"
INCLUDE "data/pokemon/base_stats/okutank.inc"
INCLUDE "data/pokemon/base_stats/gongu.inc"
INCLUDE "data/pokemon/base_stats/kapoerer.inc"
INCLUDE "data/pokemon/base_stats/pudie.inc"
INCLUDE "data/pokemon/base_stats/haneko.inc"
INCLUDE "data/pokemon/base_stats/poponeko.inc"
INCLUDE "data/pokemon/base_stats/wataneko.inc"
INCLUDE "data/pokemon/base_stats/baririna.inc"
INCLUDE "data/pokemon/base_stats/lip.inc"
INCLUDE "data/pokemon/base_stats/elebaby.inc"
INCLUDE "data/pokemon/base_stats/booby.inc"
INCLUDE "data/pokemon/base_stats/kireihana.inc"
INCLUDE "data/pokemon/base_stats/tsubomitto.inc"
INCLUDE "data/pokemon/base_stats/miltank.inc"
INCLUDE "data/pokemon/base_stats/bombseeker.inc"
INCLUDE "data/pokemon/base_stats/gift.inc"
INCLUDE "data/pokemon/base_stats/kotora.inc"
INCLUDE "data/pokemon/base_stats/raitora.inc"
INCLUDE "data/pokemon/base_stats/madame.inc"
INCLUDE "data/pokemon/base_stats/norowara.inc"
INCLUDE "data/pokemon/base_stats/kyonpan.inc"
INCLUDE "data/pokemon/base_stats/yamikarasu.inc"
INCLUDE "data/pokemon/base_stats/happi.inc"
INCLUDE "data/pokemon/base_stats/scissors.inc"
INCLUDE "data/pokemon/base_stats/purakkusu.inc"
INCLUDE "data/pokemon/base_stats/devil.inc"
INCLUDE "data/pokemon/base_stats/helgaa.inc"
INCLUDE "data/pokemon/base_stats/wolfman.inc"
INCLUDE "data/pokemon/base_stats/warwolf.inc"
INCLUDE "data/pokemon/base_stats/porygon2.inc"
INCLUDE "data/pokemon/base_stats/nameil.inc"
INCLUDE "data/pokemon/base_stats/haganeil.inc"
INCLUDE "data/pokemon/base_stats/kingdra.inc"
INCLUDE "data/pokemon/base_stats/rai.inc"
INCLUDE "data/pokemon/base_stats/en.inc"
INCLUDE "data/pokemon/base_stats/sui.inc"
INCLUDE "data/pokemon/base_stats/nyula.inc"
INCLUDE "data/pokemon/base_stats/houou.inc"
INCLUDE "data/pokemon/base_stats/togepy.inc"
INCLUDE "data/pokemon/base_stats/bulu.inc"
INCLUDE "data/pokemon/base_stats/tail.inc"
INCLUDE "data/pokemon/base_stats/leafy.inc"
