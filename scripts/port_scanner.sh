#!/bin/bash
echo "===== OPEN PORTS ====="
ss -tuln
echo ""
echo "===== ACTIVE CONNECTIONS ====="
ss -tunp
echo ""
echo "===== LISTENING SERVICES ====="
systemctl list-units --type=service --state=running