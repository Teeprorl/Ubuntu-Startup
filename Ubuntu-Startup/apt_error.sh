#!/bin/bash

ps -lefjH | grep "apt install" > file.txt

declare x = $(( awk {print ${4}} ))

kill -SIGKILL $(x)
rm file.txt
