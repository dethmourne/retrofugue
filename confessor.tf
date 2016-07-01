#################################################
##  Loktai's Confessor Macro Set For Dummies   ##
##           Last Update: 06/30/2016           ##
#################################################

## Summon mask - once/boot, set target to "brow" or "head" as desired. ##
/def mask = /_invoke summon mask at brow
## End Mask Summon block ##

## Mask minors - setting unique names for stacking purposes ##
; Mask of Emptiness - Self-buff Phys resist (25%)
/def mask_phys = \
  /_invoke mask of emptiness
; Mask of Air - Self-buff Asphyx resist (25%)
/def mask_asphyx = \
  /_invoke mask of air
; Mask of Deafness - Self-buff Sonic resist (25%)
/def mask_sonic = \
  /_invoke mask of deafness
; Mask of Truth - Self-buff illusion resist (25%)
/def mask_illus = \
  /_invoke mask of truth
## End Mask minor block ##

## Mask offensive spells ##
; Mask of Fury - 400 dmg, 75% psi, 25% holy, 2 rounds base
/def mask_fury = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke mask of fury%;\
    /else \
    /_invoke mask of fury at %{target}%;\
  /endif
; Mask of Rage - 324 dmg, 75% sonic, 25% holy, 6 rounds base, Area
/def mask_rage = \
    /_invoke mask of rage
; Mask of Ruin - 700 dmg, 75% harm, 25% holy, 4 rounds base
/def mask_ruin = \
  /if ({1} != '') \
    /set target %{*}%;\
  /endif%;\
  /if ({target} =~ 'monster') \
    /_invoke mask of ruin%;\
    /else \
    /_invoke mask of ruin at %{target}%;\
  /endif
## End Offensive spell block ##

## Misc Confessor spells - prots/etc ##
; Mask of Judgement - check mob align
/def mask_align = \
  /_invoke mask of judgement at %{*}
; Mask of Magic - See Magic
/def mask_magic = \
  /_invoke mask of magic
; Mask of Night - see in dark/udark
/def mask_dark = \
  /_invoke mask of night
; Mask of Light - see in light/ulight
/def mask_light = \
  /_invoke mask of light
; Spirit Threads - a scouting spell
/def mask_threads = \
  /_invoke spirit threads
; Black Portal - Self-transport to Chaos Plains
/def mask_perdow = \
  /_invoke black portal
; Mask of Vision - See Invisible
/def mask_invis = \
  /_invoke mask of vision
; Mask of Fasting - Feeds the caster
/def mask_food = \
  /_invoke mask of fasting
; Mask of Breathing - self-wb spell
/def mask_wb = \
  /_invoke mask of breathing
; Mask of Voices - cancels silence.
/def mask_scream = \
  /_invoke mask of voices
; Steel Skin - con buff to self
/def mask_con = \
  /_invoke steel skin
; Spirit Flight - magic flight to self
/def mask_flight = \
  /_invoke spirit flight
; Summon Soul Sword - summons a 1h katana sized for caster, bound to caster.
/def mask_sword = \
  /_invoke summon soul sword
; Mask of Perception - per buff to self
/def mask_per = \
  /_invoke mask of perception
; Mask of Regeneration - untested, appears to be a choler-type effect to self.
/def mask_regen = \
  /_invoke mask of regeneration
## End misc Confessor spell block ##

## Confessor skills ##
; First aid - Emergency revive for unconscious players
/def aid = \
  use first aid at %{1}
; Case - check mob inventory
/def case = \
  /_use case at %{*}
; Fearlessness - Protects against Minstrel's Wrath, amongst other debuffs
/def nofear = \
  /_use fearlessness
; Enhanced peer - like peer, but enhanced! Valid target is <room exit>.
/def epeer = \
  /_use enhanced peer at %{1}
; Scouting - kind of like enhanced peer? Same target scheme.
/def scouting = \
  /_use scouting at %{1}
; Sonic Step - sneak for "not-sneaky" people. Toggles with skill use.
/def sonic_step = \
  /_use sonic step
; Release Seal - Mystic, once per boot, for one (1) thin blade. Must be in combat wielding the desired weapon.
/def release_seal = \
  /_use release seal at %{weapon1}

## Confessor Trigger for auto-unsilence ##
/def -F -t'You are magically silenced and cannot cast!' mask_autoscream = \
  /mask_scream
