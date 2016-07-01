#################################################
##    Loktai's Paladin Macro Set For Dummies   ##
##           Last Update: 06/30/2016           ##
#################################################

## EQ Labelling ##
; label gear - set labels/gear needs as desired.
/def labelgear = \
  label all armor as lokgear%;\
  label pot as venusian%;\
  label all held as tiranstuff%;\
  label all weapon as lokweap%;\
  label chain as autosticky

## Bless Armor Macro Set. ##
## IMPORTANT: Adjust bless_done trigger to match your racial speech. ##
/def blessgear = \
  /set eqlabel=$[toupper({1})]%;\
  /set dtype=$[tolower({2})]%;\
  /set eqnum 1%;\
  /set eqwork=1%;\
  /_bless

/def _bless = \
  /_invoke bless armor at %{eqlabel} %{eqnum} with %{dtype}

/def -F -t'That item has already been blessed.' _blessnext = \
  /set eqnum=$[{eqnum}+1]%;\
  /_bless

/def -F -t'You sizzle with magical energy.' _blessmore = \
  /if ({eqwork} == 1) \
    /_bless%;\
  /endif

/def -F -t'It needs to be on the floor.' _blessdone = \
  /if ({eqwork} == 1) \
    /set eqwork=0%;\
    say %{eqlabel} now blessed with %{dtype}.%;\
  /endif

/def -t'You chant \'Rightbringer, bestow your bressing upon this humbre toor of your' bless_done = \
  /_bless
## End Bless armor macro set block. ##

## Autodues - Set to after corpse is looted. ##
/def -mregexp -F -t'from the corpse 1.$' looted = \
  /if ({autodues}) \
    unwield all%;\
    wield shield of honor%;\
    dues%;\
  /endif
## End Autodues block. ##

## Duesing - dues entire room ##
/def -F -t'You lay the corpse to rest.' dues_more = \
  /def -p2 -1 -t'You can act again.' duesagain = \
    dues
/def -F -t'There is no corpse on the ground here.' dues_done = \
  /arm
## End Roomwide Dues block. ##

## Paladin Defensive Spells ##
; Bestow - self-heal
/def bestow = \
  /_invoke bestow
; Canticle - minor heal on target
/def canticle = \
  /_invoke canticle at %{1}
; Holy Vengeance - self-haste
/def haste = \
  /_invoke holy vengeance
; Shepherd - basically a reflect that lets you take the hit for a midrower.
/def shepherd = \
  /_invoke shepherd at %{1}
; Heraldic Aura - minor resistance based on your shield charge.
/def h_aura = \
  /_invoke heraldic aura
; Heraldic Might - Spell based on shield charge. ####### IMPORTANT - TARGETTING DEPENDS ON CHARGE ########
/def h_might = \
  /_invoke heraldic might
; Sikkar's Gaze - Self-prot Illusion (25%)
/def sgaze = \
  /_invoke sikkars gaze
; Sikkar's Will - Self-prot Psionic (25%)
/def swill = \
  /_invoke sikkars will
; Glorious Light - technically a shelter spell, but mostly for dispelling Teufel's Trap
/def glight = \
  /_invoke glorious light
## End Defensive Spells ##

## Paladin EQ Spells - Not including Bless Armor ##
; Holy Weapon - +Attack, blocks "enchant" spells. Works on indest weapons.
/def h_weap = \
  /_invoke holy weapon at %{1}
; Consecrate Weapon - +Damage, Harden, blocks "enchant" spells. Non-Indest only.
/def c_weap = \
  /_invoke consecrate weapon at %{1}
; Glow - emit, but only light emits. Not sure what if anything it blocks.
/def glow = \
  /_invoke glow at %{1}
; Sword of Faith - summons an undroppable sword, approx wc40. Usable until boot.
/def sof = \
  /_invoke sword of faith
## End Paladin EQ Spell Block. ##

## Paladin Offensive Spells ##
; Minor Dispel Evil - 450 damage, 100% holy, 3 rounds base.
/def mde = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke minor dispel evil%;\
    /else \
    /_invoke minor dispel evil at %{target}%;\
  /endif
; Dispel Evil - 700 damage, 100% holy, 4 rounds base.
/def de = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke dispel evil%;\
    /else \
    /_invoke dispel evil at %{target}%;\
  /endif
; Heraldic Strike - 900 damage, 100% shield charge dtype, 5 rounds base.
/def hstrike = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke heraldic strike%;\
    /else \
    /_invoke heraldic strike at %{target}%;\
  /endif
; Dispel Evil Magic - Theoretically dispels certain prots that evil mobs cast.
/def dem = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke dispel evil magic%;\
    /else \
    /_invoke dispel evil magic at %{target}%;\
  /endif
; Divine Retribution - 500 damage, 100% holy, 7 rounds base. Area.
/def dret = \
  /_invoke divine retribution
; Fist of Sikkar - 750 damage, 50% phys, 50% holy, 4 rounds base.
/def fist = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke fist of sikkar%;\
    /else \
    /_invoke dispel evil magic at %{target}%;\
  /endif
## End Paladin Offensive Spell block. ##

## Paladin Misc Spell Block ##
; Halo - Light/Dark spell. Invoke for light, "halo flip" to generate dark instead.
/def halo = \
  /_invoke halo at %{1}
## End Misc Spell block. ##

## Paladin Offensive Skill Block ##
; Melee Targetting - set the target global variable and attempt to melee them.
/def mtarget = \
  /set target %{*}%;\
  /_use melee targeting at %{target}
