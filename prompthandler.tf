#################################################
## Loktai's Prompt & Tick Handling For Dummies ##
##          Last Updated: 06/30/2016           ##
#################################################

##      IMPORTANT:
##      Assumes prompt format as follows:
## prompt Hp: <hp> Sp: <sp> Ep: <ep> Cash: <cash> Bank: <bank> Exp: <exp> Wielded: <wielded>><\n>

## Prompt / Tick Handlers ##
/def -ag -mregexp -F -t'^Hp: (.*)/(.*) Sp: (.*)/(.*) Ep: (.*)/(.*) Cash: (.*) Bank: (.*) Exp: (.*) Wielded: (.*)>$' promptcatch = \
  /set hp=%P1%;\
  /set hpmax=%P2%;\
  /set sp=%P3%;\
  /set spmax=%P4%;\
  /set ep=%P5%;\
  /set epmax=%P6%;\
  /set cash=%P7%;\
  /set bank=%P8%;\
  /set exp=%P9%;\
  /set wielded=%P10
/def -ag -mregexp -F -t'^Hp: (.*\d+)/(\d+)  Sp: (.*\d+)/(\d+)  Ep: (.*\d+)/(\d+)$' hb_tick = \
  /set hp=%P1%;\
  /set hpmax=%P2%;\
  /set sp=%P3%;\
  /set spmax=%P4%;\
  /set ep=%P5%;\
  /set epmax=%P6%;\
/def -mregexp -F -t'--- HP:(.*\d+)/(/d+)  SP:(.*\d+)/(\d+)  EP:(.*\d+)/(\d+)' combat_round = \
  /set hp=%P1%;\
  /set hpmax=%P2%;\
  /set sp=%P3%;\
  /set spmax=%P4%;\
  /set ep=%P5%;\
  /set epmax=%P6
/def -mregexp -F -t'EQ Tick: Hp: (.*)/(\d+)  Sp: (.*)/(\d+)  Ep: (.*)/(\d+)$' eq_tick = \
  /set hp=%P1%;\
  /set hpmax=%P2%;\
  /set sp=%P3%;\
  /set spmax=%P4%;\
  /set ep=%P5%;\
  /set epmax=%P6
## End handlers ##
