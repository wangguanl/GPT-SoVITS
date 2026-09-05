"""Re-export of ``jieba.posseg`` under the ``jieba_fast.posseg`` namespace."""

from jieba.posseg import (  # noqa: F401
    POSTokenizer,
    cut,
    enable_paddle,
    initialize,
    lcut,
    pair,
    resolve_filename,
    setLogLevel,
)