The Plan
========

Goal
-------

Replace the JavaScript engine (V8) in Chromium with a lightweight, secure Python VM written in C++.  
Python will become the browser’s native scripting language for DOM manipulation, event handling, and logic.

Phase 1: Chromium Setup & Preparation
----------------------------------------

- [ ] Fork and build Chromium successfully
- [ ] Understand the ``content/``, ``v8/``, ``blink/``, and ``renderer/`` directories
- [ ] Locate ``<script>`` tag parsing and V8 integration logic
- [ ] Disable or stub out V8 to prevent JS execution

Phase 2: Embedding CPython (Prototype)
-----------------------------------------

- [ ] Embed CPython interpreter in the renderer process
- [ ] Execute Python scripts from ``<script type="text/python">``
- [ ] Output ``print()`` to DevTools console
- [ ] Implement basic ``console.log()`` via Python bindings
- [ ] Prototype DOM access: ``document.getElementById(...)``

Phase 3: Sandboxing & API Restrictions
-----------------------------------------

- [ ] Disable dangerous Python modules (``os``, ``sys``, ``socket``, etc.)
- [ ] Add runtime memory and CPU constraints
- [ ] Build a safe standard library with:
  
  - [ ] ``console``, ``math``, ``time``, ``events``
  - [ ] Lightweight async event loop

Phase 4: Full JS Removal
---------------------------

- [ ] Remove V8 glue in Blink (``bindings/core/v8``)
- [ ] Delete JS-exposed APIs and IDL files
- [ ] Remove JS bindings in the DevTools and other modules

Phase 5: Replace CPython with Custom Python VM
--------------------------------------------------

- [ ] Design VM architecture:
  
  - [ ] Stack-based bytecode interpreter in C++
  - [ ] Lexer, parser, compiler for a Python-like subset

- [ ] Implement core VM engine:

  - [ ] Arithmetic, logic, conditionals
  - [ ] Loops, functions, variables, classes

- [ ] Map VM objects to DOM wrappers (``Element``, ``Window``)
- [ ] Build secure DOM interface bindings (read/write access)
- [ ] Run ``<script type="text/python">`` directly in your VM

Phase 6: DevTools + Python Debugging
----------------------------------------

- [ ] Enable Python console in DevTools
- [ ] Add breakpoint support (optional)
- [ ] Highlight script errors and show Python stack trace

Phase 7: Final Polish and Public Release
--------------------------------------------

- [ ] Add ``.pyhtml`` file support (Python + HTML)
- [ ] Build demos: DOM manipulation, animation, events
- [ ] Write documentation and API reference
- [ ] Open-source on GitHub