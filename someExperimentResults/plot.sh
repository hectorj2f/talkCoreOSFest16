#!/bin/bash

INPUT_DIR=$1
OUTPUT_DIR=$2


gnuplot << EOF
set title "Time (seconds) / Completion delay (seconds) -- 3k units"
set xlabel "Time (seconds)"
set ylabel "Completation delay (seconds)"
set terminal postscript eps color solid
set style line 1 lt 1 lw 2 lc 1
set style line 2 lt 1 lw 2 lc 2
set style line 3 lt 1 lw 2 lc 3
set style line 4 lt 1 lw 2 lc 4
set style line 5 lt 1 lw 2 lc 5
set terminal svg
set output "${OUTPUT_DIR}/units_start.svg"
plot  [0:500] [0:350] "${INPUT_DIR}/3000_grpc/units_start.dat"  using 1:2 with lines ls 1 title "fleet-grpc", "${INPUT_DIR}/3000_etcd/units_start.dat"  using 1:2 with lines ls 2 title "fleet-etcd"
EOF


gnuplot << EOF
set title "Time (seconds) / Number of units -- 3k units -- fleet-grpc"
set xlabel "Time (seconds)"
set ylabel "Number of units"
set terminal postscript eps color solid
set style line 1 lt 1 lw 2 lc 1
set style line 2 lt 1 lw 2 lc 2
set style line 3 lt 1 lw 2 lc 3
set style line 4 lt 1 lw 2 lc 4
set style line 5 lt 1 lw 2 lc 5
set terminal svg
set output "${OUTPUT_DIR}/units_start_count_grpc.svg"
plot  [0:500] [0:3000] "${INPUT_DIR}/3000_grpc/units_start_count.dat"  using 1:2 with boxes ls 1 title "starting", "${INPUT_DIR}/3000_grpc/units_start_count.dat"  using 3:4 with lines ls 2 title "running"
EOF

gnuplot << EOF
set title "Time (seconds) / Number of units -- 3k units -- fleet-etcd"
set xlabel "Time (seconds)"
set ylabel "Number of units"
set terminal postscript eps color solid
set style line 1 lt 1 lw 2 lc 1
set style line 2 lt 1 lw 2 lc 2
set style line 3 lt 1 lw 2 lc 3
set style line 4 lt 1 lw 2 lc 4
set style line 5 lt 1 lw 2 lc 5
set terminal svg
set output "${OUTPUT_DIR}/units_start_count_etcd.svg"
plot  [0:500] [0:3000] "${INPUT_DIR}/3000_etcd/units_start_count.dat"  using 1:2 with boxes ls 1 title "starting", "${INPUT_DIR}/3000_etcd/units_start_count.dat"  using 3:4 with lines ls 2 title "running"
EOF


gnuplot << EOF
set title "Time (seconds) / Number of units -- 3k units -- fleet-etcd"
set xlabel "Completion time (secs)"
set ylabel "Delay time (secs"
set terminal postscript eps color solid
set style line 1 lt 1 lw 2 lc 1
set style line 2 lt 1 lw 2 lc 2
set style line 3 lt 1 lw 2 lc 3
set style line 4 lt 1 lw 2 lc 4
set style line 5 lt 1 lw 2 lc 5
set yrange [0:270]
set y2range [0:3000]
set y2label 'Number of units'
set ytics nomirror
set y2tics
set terminal svg
set output "${OUTPUT_DIR}/units_start_multi_etcd.svg"
plot  [0:500] [0:3000] "${INPUT_DIR}/3000_etcd/units_start_multi.dat"  using 1:2 with dots ls 1 title "delay" axes x1y1, "${INPUT_DIR}/3000_etcd/units_start_multi.dat"  using 2:3 with lines ls 2 title "running" axes x1y2
EOF

gnuplot << EOF
set title "Time (seconds) / Number of units -- 3k units -- fleet-grpc"
set xlabel "Completion time (secs)"
set ylabel "Delay time (secs"
set terminal postscript eps color solid
set style line 1 lt 1 lw 2 lc 1
set style line 2 lt 1 lw 2 lc 2
set style line 3 lt 1 lw 2 lc 3
set style line 4 lt 1 lw 2 lc 4
set style line 5 lt 1 lw 2 lc 5
set yrange [0:90]
set y2range [0:3000]
set y2label 'Number of units'
set ytics nomirror
set y2tics
set terminal svg
set output "${OUTPUT_DIR}/units_start_multi_grpc.svg"
plot  [0:500] [0:3000] "${INPUT_DIR}/3000_grpc/units_start_multi.dat"  using 1:2 with dots ls 1 title "delay" axes x1y1, "${INPUT_DIR}/3000_grpc/units_start_multi.dat"  using 2:3 with lines ls 2 title "running" axes x1y2
EOF
