# Minimal makefile for Sphinx documentation

SPHINXOPTS       ?=
SOURCEDIR        = source
BUILDDIR         = build

# Detect Windows (cmd or PowerShell)
ifeq ($(OS),Windows_NT)
    SPHINXBUILD     ?= .venv/Scripts/sphinx-build.exe
    SPHINXAUTOBUILD ?= .venv/Scripts/sphinx-autobuild.exe
    PIP             ?= .venv/Scripts/pip.exe
    PYTHON          ?= .venv/Scripts/python.exe
else
    SPHINXBUILD     ?= .venv/bin/sphinx-build
    SPHINXAUTOBUILD ?= .venv/bin/sphinx-autobuild
    PIP             ?= .venv/bin/pip
    PYTHON          ?= .venv/bin/python
endif

.PHONY: help Makefile setup setup-novenv dev dev-novenv

# Default target: Run sphinx-autobuild with venv
dev:
	@$(SPHINXAUTOBUILD) "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# help target
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Setup virtual environment and install dependencies
setup:
	python -m venv .venv
	$(PYTHON) -m pip install --upgrade pip
	$(PIP) install -r requirements.txt

# Replit-compatible setup without virtual environment
setup-novenv:
	pip install --upgrade pip
	pip install -r requirements.txt

# Replit-compatible dev without venv
dev-novenv:
	@sphinx-autobuild "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# Catch-all: route unknown targets to Sphinx
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
