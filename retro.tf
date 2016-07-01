##########################################
##  Loktai's RetroMUD TinyFugue Script  ##
##       Last Updated: 06/30/2016       ##
##########################################

## Load Scripts ##
/cd retroMUD
/require retro_anti-idle.tf
/load protfalls.tf
/load prompthandler.tf
/load paladin.tf
/load confessor.tf

## Pre-set any desired variables ##
/set autodues=0
/set boxgold=0
/set autoloot=0
/set autowake=1
/set casting=0
/set lootbox=SOLO

## Main Notify Macro ##
/def notify = party say --- %* ---%;/_echo --- %* ---

## TinyFugue Status Bar ##
/status_defaults
/status_add -B@world "Hp:_" hp:5 "/_" hpmax:5 "Sp:_" sp:5 "/_" spmax:5 "Ep:_" ep:5 "/_" epmax:5 "Gold:_" cash:6 "Bank:_" bank:8 "Exp:_" exp:10 "Wielded:_" wielded:1 "__<(^_^)>__"

## Skill/Spell/Power Check ##
/def -t'You start concentrating on a spell.' casting_nonoffense = \
  /set casting=1
/def -t'You are done invoking your magic.' casting_done = \
  /set casting=0
/def -t'You stop what you are doing.' not_casting = \
  /set casting=0
/def -t'You decide to stop what you are doing.' intentionally_not_casting = \
  /set casting=0
/def -t'You start concentrating on an offensive spell.' casting_offense = \
  /set casting=1
/def -t'You start concentrating on the skill.' skilling = \
  /set casting=1

## Party Status check (each round) ##
/def -mregexp -t'^ \*\*\* NEW ROUND \*\*\*' new_round = \
  party status short all

## Arming macros (multi-limb support) ##
/def arm = \
  detach chain%;\
  unwield all%;\
  attach chain to %{weapon1}%;\
  wield %{weapon1}%;\
  /if ({weapon2} !~ "") \
    wield %{weapon2}%;\
    /if ({weapon3} !~ "") \
      wield %{weapon3}%;\
      /if ({weapon4} !~ "") \
        wield %{weapon4}%;\
      /endif%;\
    /endif%;\
  /endif
/def polemode = \
  /set weapon1=gogira polearm%;\
  /unset weapon2%;\
  /unset weapon3%;\
  /unset weapon4%;\
  /arm
/def dprmode = \
  /set weapon1=bonesaw%;\
  /set weapon2=Svalinn%;\
  /unset weapon3%;\
  /unset weapon4%;\
  /arm
/def sprmode = \
  /set weapon1=requiem%;\
  /set weapon2=Svalinn%;\
  /unset weapon3%;\
  /unset weapon4%;\
  /arm
/def firemode = \
  /set weapon1=glammring%;\
  /set weapon2=Svalinn%;\
  /unset weapon3%;\
  /unset weapon4%;\
  /arm

## Auto-unwield triggers ##
/def -t'A continuum in the time-space anomaly' raji_rift = unwield all

## Reprot macro - spammy ##
/def rp = \
  rp%;\
  rp%;\
  rp%;\
  rp%;\
  rp

## Goldboxing trigger ##
/def -mregexp -t'^Money\: \d+ (coin|coins) \((\d+) (\w+)' box_gold = \
  /if ({boxgold}) \
    put %P2 %P3 in %{lootbox}%;\
    i short%;\
  /endif
/def -mregexp -t'^You don\'t see a (.*) here!$' nobox = \
  /if (%P1 =~ {lootbox}) \
    /set boxgold 0%;\
  /endif

## Party Triggers ##
/def -mregexp -t'^\w+ \(Party\):.*party stand' party_stand = \
  stand
/def -mregexp -t'^\w+ \(Party\):.*party unwield' party_unwield = \
  unwield all
/def -mregexp -t'^\w+ \(Party\):.*party wield' party_wield = \
  /arm

## Cast/Invoke/Use macros ##
/def _invoke = \
  /if ({casting} == 0) \
    invoke %{*}%;\
  /endif
/def _cast = \
  /if ({casting} == 0) \
    cast %{*}%;\
  /endif
/def _use = \
  /if ({casting} == 0) \
    use %{*}%;\
  /endif
