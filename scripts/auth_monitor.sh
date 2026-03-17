#!/bin/bash
echo "=============FAILED LOGIN ATTEMPTS============="
journalctl _SYSTEMD_UNIT=sshd.service | grep "Failed" | tail -20
echo ""
echo "=============SUCCESSFUL LOGINS==============="
journalctl _SYSTEMD_UNIT=sshd.service | grep "Accepted" | tail -n 10 
echo ""
echo "==============SUSPICIOUS IPS================="
journalctl _SYSTEMD_UNIT=sshd.service | grep "Failed" | awk '{print $11}' | sort | uniq -c | sort -rn | head -10
echo ""
echo "===== INVALID USER ATTEMPTS ====="
journalctl | grep "Invalid user" | awk '{print $8,$10}' | sort | uniq -c | sort -rn | head -n 10
