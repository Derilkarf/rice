#!/bin/bash
# Untuk mengetahui disk & devices yg tersedia

icon=$'\uf287'

list=$(findmnt -rno TARGET,SOURCE | awk -v p="/run/media/$USER/" 'index($1,p)==1')
count=$(printf '%s' "$list" | grep -c .)

if [ "$count" -gt 0 ]; then
  tip=$(printf '%s' "$list" | awk '{n=split($1,a,"/"); printf "%s → %s\\n", a[n], $2}')
  echo "{\"text\":\"$icon $count\",\"tooltip\":\"$tip\",\"class\":\"active\"}"
else
  echo "{\"text\":\"$icon\",\"tooltip\":\"Tidak ada disk eksternal\",\"class\":\"idle\"}"
fi
