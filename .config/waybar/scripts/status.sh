#!/bin/sh

# Fetch readings
TEMP="$(sensors | awk '/^Package id 0:/ {print $4}')"
CPU="$(top -bn1   | awk '/Cpu/           {printf("%.1f%%",$2+$4)}')"
MEM="$(free -m    | awk '/Mem:/          {printf("%.0f%%",$3/$2*100)}')"

# Prepare fields
txt=""
tip="Temp: ${TEMP}\nCPU: ${CPU}\nMem: ${MEM}"

# Echo JSON, escaping the inner quotes
echo "{\"text\":\"${txt}\",\"tooltip\":\"${tip}\",\"alt\":\"${tip}\"}"
