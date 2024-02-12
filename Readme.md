# Introduction

The integration of jdtls and neo vim is bit too hectic. Configuring it with Mason makes it difficult to tweak the JDTLS setup. Setting it up manually takes bit too much effort as well. 

No promises, but we will try to make the process easier. I am thinking of using lua for this. If that doesn't work out, we will try to create a node console application. 

## Why lua?

1. Intention is to learn lua while doing something useful. 
2. This project is being developed in Windows. I needed a scripting tool which is cross platform. Lua seemed more light weight that node and python.
3. Latest version of PowerShell is cross-platform. However, I am not sure how compatible it is with older linux and windows OS. 

*Update*

Using Lua is not working out. Basic utilities like deleting a directory needs a dependency. I am hoping a better result using ANT. 


