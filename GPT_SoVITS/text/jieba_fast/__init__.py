"""jieba_fast shim package.

jieba_fast is a Cython-accelerated, API-compatible fork of the pure-Python
``jieba`` (drop-in: ``import jieba_fast as jieba``). Building it from source
requires a C compiler (MSVC), which may not be present on every machine. To
avoid that, this package re-exports the pure-Python ``jieba`` implementation,
which exposes the same public API (``cut``/``lcut``/``posseg``/``setLogLevel``
...).
"""

import jieba as _jieba

from jieba import (  # noqa: F401
    Tokenizer,
    add_word,
    calc,
    cut,
    cut_for_search,
    del_word,
    disable_parallel,
    dt,
    enable_parallel,
    get_DAG,
    initialize,
    load_userdict,
    lcut,
    lcut_for_search,
    setLogLevel,
    suggest_freq,
)