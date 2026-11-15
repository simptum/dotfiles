# ~/.config/hypr/scripts/keycodes.sh



# keycodes
CTRL=29; LSHIFT=42; ALT=56; SUPER=125
TAB=15; HOME=102; END=107
BACKSPACE=14
Q=16; W=17; E=18; R=19; T=20
Y=21; U=22; I=23; O=24; P=25
A=30; S=31; D=32; F=33; G=34
H=35; J=36; K=37; L=38
Z=44; X=45; C=46; V=47; B=48; N=49; M=50
N1=2; N2=3; N3=4; N4=5; N5=6
N6=7; N7=8; N8=9; N9=10; N0=11

press() {
  #sleep 0.05
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key $1:1 $1:0
}

ctrl() {
  #sleep 0.05
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key ${CTRL}:1 $1:1 $1:0 ${CTRL}:0
}

super() {
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key ${SUPER}:1 $1:1 $1:0 ${SUPER}:0
}

ctrl_shift() {
  #ydotool key ${SUPER}:0 ${ALT}:0
  #sleep 0.05
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key ${SUPER}:0 ${ALT}:0 ${CTRL}:1 ${LSHIFT}:1 $1:1 $1:0 ${LSHIFT}:0 ${CTRL}:0
}

alt() {
  #sleep 0.05
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key ${ALT}:1 $1:1 $1:0 ${ALT}:0
}

alt_shift() {
  #sleep 0.05
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key ${ALT}:1 ${LSHIFT}:1 $1:1 $1:0 ${LSHIFT}:0 ${ALT}:0
}

lshift() {
  #sleep 0.05
  YDOTOOL_SOCKET=/run/user/1000/.ydotool_socket ydotool key ${LSHIFT}:1 $1:1 $1:0 ${LSHIFT}:0
}
