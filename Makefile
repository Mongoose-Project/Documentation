# Minimal makefile for Sphinx documentation

SPHINXOPTS       ?=
SPHINXBUILD      ?= .venv/bin/sphinx-build
SPHINXAUTOBUILD  ?= .venv/bin/sphinx-autobuild
PIP              ?= .venv/bin/pip
PYTHON           ?= .venv/bin/python
SOURCEDIR        = source
BUILDDIR         = build

.PHONY: help Makefile setup setup-novenv dev dev-novenv

# Default help target
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Setup virtual environment and install dependencies
setup:
	python -m venv .venv && \
	. .venv/bin/activate && \
	.venv/bin/pip install --upgrade pip && \
	.venv/bin/pip install -r requirements.txt

# Replit-compatible setup without virtual environment
setup-novenv:
	pip install --upgrade pip
	pip install -r requirements.txt

# Run sphinx-autobuild with venv
dev:
	@$(SPHINXAUTOBUILD) "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# Replit-compatible dev without venv
dev-novenv:
	@sphinx-autobuild "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# Catch-all: route unknown targets to Sphinx
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
