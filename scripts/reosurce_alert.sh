#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80

echo "===== CPU USAGE ====="
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "Current CPU Usage: $CPU_USAGE%"

if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "⚠️  ALERT: CPU usage is critically high!"
else
    echo "✅ CPU is healthy"
fi

echo ""
echo "===== MEMORY USAGE ====="
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "Current Memory Usage: $MEM_USAGE%"

if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
    echo "⚠️  ALERT: Memory usage is critically high!"
else
    echo "✅ Memory is healthy"
fi

echo ""
echo "===== TOP 5 CPU CONSUMING PROCESSES ====="
ps aux --sort=-%cpu | head -n 6 | awk '{print $1, $2, $3, $11}'

echo ""
echo "===== TOP 5 MEMORY CONSUMING PROCESSES ====="
ps aux --sort=-%mem | head -n 6 | awk '{print $1, $2, $4, $11}'
