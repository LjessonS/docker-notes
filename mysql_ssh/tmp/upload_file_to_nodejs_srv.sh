export fn=$1

export localhost_port="172.16.29.10:10203"

cksum $fn
curl -X POST -H "Content-Type: audio_/jd_" -T $fn $localhost_port/sfksdfjs
