# Japanese Phonology



## 7. Accent

### 7.3 Accent of Compound Words

The accentual algorithm of the compound is entirely recomputed, so that accent may fall on a mora which was not accented in the simplex form of the lexeme to which it belongs.	

Main parameters:

1. The nature of the morphological and syntactic relation between the two constituents
2. the size of the compound
3. the size of each constituent of the compound
4. the grammatical category of the constituents
5. the intrinsic accent of each constituent
6. the lexical stratum of the constituents (Yamato, Sino-Japanese, Western)
7.  The degree of sonority of the vowels in the head foot
8. the degree of lexicalization of the compound

Here focus mainly on transparent compounds

###### Modifier-Head Structure

In theory on the size and original accent pattern of the second constituent.

Exception: nearly all quadrimoraic compounds containing _hito_ are atonic

__1. Short C2 (One or two morae long)__

A. Last mora of C1. If it is a deficient mora(epenthetic vowels), consisting of a special segment or single vowel, the accent might move one position leftward(NADM Priciple, non-accentuation of deficient morae). (Most productive)

e.g. denwa + kí = denwáki  
	fukúoka + shí = fukuoká shi

B. On the initial mora of C2, a small number, mainly of Yamato or Western origin. It maintains the accent of C2.

e.g. urokó + kúmo = uroko gúmo  
	garasu + mádo = garasu mádo

C.  Atonic. All C2's have its original accent on the final accent. Of Yamato or Sino-Japanese origin. Four-mora compounds of two bimoraic Yamato nouns are in their majority atonic, espcially the case here.

e.g. kodomo + heyá = kodomo heya  
	orenji + iró = orenji iro

_Generalization on A and B_

a. Keep the accent of C2 as compound accent except when it is on the very final mora.  
b. Otherwise, put a compound accent on t he final mora of C1.

__2. Long C2 (three or four morae long)__

$\quad\quad$On the first mora of C2, except when C2 has an accent neither initial nor final in isolation, which will generally be preserved within the compound. However, if an accent falls on the penultimate mora of C2 in isolation, the issue becomes tricky.

e.g. kogata + kámera = kogata kámera  
	shimáguni + kónjou = shimaguni kónjou  
	yukí + daruma = yuki dáruma  
	kuchi + yakusoku = kuchi yákusoku  
	yukí + otokó = yuki ótoko  
	nuká + yorokobí = nuka yórokobi  
    	kamí + hikóuki = kami hikóuki  
	wáka + murásaki = waka murásaki  
	énjin + sutóppu = enjin sutóppu

​	hidari + uchíwa = hidari úchiwa/uchíwa  
	yude + tamágo = yude támago/tamágo  
	onná + kokóro/kokoró = onna gókoro  
	dénki + nokogíri/nokogirí = denki nókogiri

$\quad\quad$The sonority of vowels also plays a role: when the first vowel in C2 has a lower degree of sonority than the second, the compound is more frequently accented on the antepenultimate.

e.g. oka + yadokari = oka yádokari  
	kokusan + benibana = kokusan bénibana  
	ié + shiroari = ie shiróari  
	reitou + edamame = reitou edámame

__Extra long C2__

$\quad\quad$The accent of C2 is preserved unless C2 is atonic, which causes the compound to be atonic.

e.g. shídonii + orinpíkku = shidonii orinpíkku  
	isóppu + monogátari = isoppu monogátari  
	chihóu + saibanshó = chihou saibanshó  
	minami + kariforunia = minami kariforunia



__The author's analysis__

The underlying accent of heavy syllable morphemes  
	Underlying final accent for ancient Sino-Japanese and western morphems  
	Underlying initial accent (western morphemes)

e.g. shuú > shúu (state), chuú > chúu (middle), the same for tou(party), hon(book), you(use), ryuu(stream), pin(pin), pan(bread), man(man)

báa(bar), fán(fan), kíi(key)

_Constraints_: 

1. OCP: no more than one accent peak in Prosodic word(PrWd.)
2. FAITHID(HEAD ACCENT): the accent kernel of the head noun occupies the same position in the input and in the output
3. NONFINALITY(m): the accented mora must not be final
4. NONFINALITY(f): the accented foot must not be final
5. ALIGNRIGHT: the accent lies at the right edge of the word
6. ACCENT: compounds must have an accent (atonic words are treated as exceptions)
7. ALIGNCA: stipulates that the accent is aligned with the boundary between C1 and C2, either on the last mora of C1 or on the first mora of C2

Hierarchy:

ACCENT>NONF(m)>FAITHIO(A)>NONF(f)>ALIGNCA>ALIGNRIGHT