### Makefile for Doc/Papers/
#	$Id$	

############################################################################### 
 #
 # The contents of this file are subject to the Ricoh Source Code Public
 # License Version 1.0 (the "License"); you may not use this file except
 # in compliance with the License.  You may obtain a copy of the License
 # at http://www.risource.org/RPL
 #
 # Software distributed under the License is distributed on an "AS IS" basis,
 # WITHOUT WARRANTY OF ANY KIND, either express or implied.  See the License
 # for the specific language governing rights and limitations under the
 # License.
 #
 # This code was initially developed by Ricoh Silicon Valley, Inc.  Portions
 # created by Ricoh Silicon Valley, Inc. are Copyright (C) 1995-2000.  All
 # Rights Reserved.
 #
 # Contributor(s):
 #
############################################################################## 


PIADIR=$(HOME)/PIA
MF_DIR=$(PIADIR)/Config/makefiles
MYNAME=Papers
MYPATH=Doc

#include $(MF_DIR)/text.make

.SUFFIXES: .slides .html

PROCESS=$(PIADIR)/bin/process
SLIDES_TS = $(PIADIR)/Tagsets/slides.ts

%.html: %.slides $(SLIDES_TS) slides.ts
	time $(PROCESS) -t slides $*.slides > $@

SUBDIRS= Images

EXCLUDE = $(wildcard *.slides.html) HEADER.html index.html

FILES = $(filter-out $(EXCLUDE), $(wildcard *.html))

SLIDES= $(wildcard *.slides)
SLIDE_HTML = $(SLIDES:.slides=.html)

all:: $(SLIDE_HTML)

*.slides.html: config.inc


