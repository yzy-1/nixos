ALL_FEATURES='abvf, abvm, abvs, aalt, akhn, nalt, halt, afrc, valt, vhal, blwf, blwm, blws, cpsp, c2pc, c2sc, case, cpct, cv01, cv02, cv03, cv04, cv05, cv06, cv07, cv08, cv09, cv10, cv11, cv12, cv13, cv14, cv15, cv16, cv17, cv18, cv19, cv20, cv21, cv22, cv23, cv24, cv25, cv26, cv27, cv28, cv29, cv30, cv31, cv32, cv33, cv34, cv35, cv36, cv37, cv38, cv39, cv40, cv41, cv42, cv43, cv44, cv45, cv46, cv47, cv48, cv49, cv50, cv51, cv52, cv53, cv54, cv55, cv56, cv57, cv58, cv59, cv60, cv61, cv62, cv63, cv64, cv65, cv66, cv67, cv68, cv69, cv70, cv71, cv72, cv73, cv74, cv75, cv76, cv77, cv78, cv79, cv80, cv81, cv82, cv83, cv84, cv85, cv86, cv87, cv88, cv89, cv90, cv91, cv92, cv93, cv94, cv95, cv96, cv97, cv98, cv99, cjct, cfar, calt, clig, cswh, curs, dnom, dlig, dist, expt, falt, frac, fwid, ccmp, haln, half, hwid, hngl, hist, hlig, hkna, hojo, init, isol, ital, jp04, jp78, jp83, jp90, jalt, kern, lnum, ljmo, lfbd, ltra, ltrm, locl, mark, mset, mkmk, mgrk, medi, med2, nlck, nukt, numr, onum, opbd, size, ordn, ornm, pcap, pref, pres, psts, pstf, pnum, pkna, pwid, qwid, rand, rkrf, rphf, rlig, rtbd, rtla, rtlm, ruby, sinf, smpl, zero, smcp, liga, salt, ss01, ss02, ss03, ss04, ss05, ss06, ss07, ss08, ss09, ss10, ss11, ss12, ss13, ss14, ss15, ss16, ss17, ss18, ss19, ss20, subs, sups, swsh, tnum, fina, fin2, fin3, twid, titl, trad, tnam, tjmo, unic, vatu, vert, vrt2, vkna, vkrn, vjmo'

.PHONY: all clean

all: build/KuliaMonoNerdFont-BlackItalic.ttf build/KuliaMonoNerdFont-Black.ttf build/KuliaMonoNerdFont-BoldItalic.ttf build/KuliaMonoNerdFont-BoldLatin.ttf build/KuliaMonoNerdFont-Bold.ttf build/KuliaMonoNerdFont-ExtraBoldItalic.ttf build/KuliaMonoNerdFont-ExtraBold.ttf build/KuliaMonoNerdFont-LightItalic.ttf build/KuliaMonoNerdFont-Light.ttf build/KuliaMonoNerdFont-MediumItalic.ttf build/KuliaMonoNerdFont-Medium.ttf build/KuliaMonoNerdFont-RegularItalic.ttf build/KuliaMonoNerdFont-RegularLatin.ttf build/KuliaMonoNerdFont-Regular.ttf build/KuliaMonoNerdFont-SemiBoldItalic.ttf build/KuliaMonoNerdFont-SemiBold.ttf

JuliaMono-%.nopalt.ttf: JuliaMono-%.ttf
	fonttools subset $< --layout-features=$(ALL_FEATURES) --unicodes='0-2fff,3040-feff,fff0-fffff' --output-file=$@

JuliaMono-%.featfreeze.ttf: JuliaMono-%.nopalt.ttf
	pyftfeatfreeze -f 'zero,ss01,ss08,ss13' $< $@
	python3 ./fontname.py 'Julia' 'Kulia' $@

build/KuliaMonoNerdFont-%.ttf: JuliaMono-%.featfreeze.ttf
	nerd-font-patcher $< -c -l -out build

clean:
	rm -rf build/KuliaMonoNerdFont-*.ttf
	rm -rf JuliaMono-*.featfreeze.ttf
	rm -rf JuliaMono-*.nopalt.ttf
