#!/bin/bash
sudo pacman -Rns $(pacman -Qtdq)
exit 0
