#!/bin/zsh
ansible-playbook -i inventory update_mastodon.yml
ansible-playbook -i inventory update_mastodon.yml --tags restart -l spica
sleep 30
ansible-playbook -i inventory update_mastodon.yml --tags restart -l altair
sleep 30
