##################################################
##  Loktai's Protfall/Knockdown/Stun Notifiers  ##
##           Last Update: 06/30/2016            ##
##################################################

/def -mregexp -F -t'The protection of (.*) wears off.' mainprotfall = /notify %P1 down.

/def -F -t'You can act again.' unpara = \
  /notify Unparalyzed.%;\
  stand

/def -F -t'You feel the chi leave your veins!' pi_down = \
  /notify Poison Immunity down.

/def -F -t'You can get up again.' standup = stand

/def -F -t'You fall asleep.' slept = /if ({autowake}) wake%;\/endif

/def -F -t'You are magically silenced and cannot cast!' silent_bob = \
  grumble silently%;\
  mutter silently%;\
  whine silently

/def -F -t'You are no longer slowed.' not_slowed = \
  /notify No longer slowed.

/def -mregexp -F -t'summons a guardian demon to protect (.*)' demon_up = \
  /notify Guardian Demon up on %P1!

/def -mregexp -F -t'swings his axe at Loktai with enough force to break' paln_shield = \
  unwield %{weapon2}%;\
  wield %{weapon2}

/def -F -t'Psychic feedback no longer protects you.' feedback_down = \
  /notify Psychic Feedback down.

/def -F -t'The aura strengthening your life force fades away.' ad_down = \
  /notify Antidrain down.

/def -F -t'The lead coating falls off of you.' hw_down = \
  /notify Heavy Weight down.

/def -F -t'The song\'s emotion ebbs out of your mind.' esong_down = \
  /notify Emotion Song down.

/def -F -t'You are no longer hasted.' haste_down = /notify Haste down.

/def -F -t'You feel less confident as oak heart fades.' oak_heart_down = \
  /notify Oak Heart down.

/def -F -t'You feel less motivated.' morale_down = /notify Morale down.

/def -F -t'You feel your adrenaline flow decreasing.' choler_down = \
  /notify Choler down.

/def -F -t'You feel your phlegm returning to stability.' snot_down = \
  /notify Minor Phlegm down.

/def -F -t'Your equipment is no longer protected from damage.' eqprot_down = \
  /notify Equipment Protection down.

/def -F -t'You feel your strength of will fade away.' iw_down = \
  /notify Iron Will down.

/def -F -t'Your feeling of heroism fades away.' hero_down = \
  /notify Heroism down.

/def -mregexp -F -t'The pretty colors go away' hallucination_down = \
  /notify No longer hallucinating.

/def -F -t'You are no longer stunned.' stun_down = \
  /notify No longer stunned.%;\
  stand

/def -F -t'You feel the effects of the poison leaving your veins.' poison_down = \
  /notify No longer poisoned.

/def -F -t'Your physical being is now vulnerable once again.' sol_down = \
  /notify Solidity down.

/def -F -t'You lose control over Fate.' luck_down = \
  /notify Luck down.

/def -F -t'You don\'t feel quite so confident anymore.' fearless_down = \
  /notify Fearlessness down.

/def -F -t'You feel a burden being lifted from your soul.' wrath_down = \
  /notify Minstrel's Wrath down.
