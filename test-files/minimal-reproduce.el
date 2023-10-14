;;; -*- lexical-binding: t; -*-

(require 'treesit)


(add-to-list 'treesit-language-source-alist
             `(hcl . ("https://github.com/MichaHoffmann/tree-sitter-hcl"
                      ,(getenv "TREE_SITTER_HCL_REF")
                      "src")))

(treesit-install-language-grammar 'hcl)

(with-temp-buffer
  (insert-file-contents "example.hcl")
  ;; `treesit-parser-create' creates a parser for the buffer that is
  ;; then invoked lazily. Using `treesit-parse-string' to force parse.
  (treesit-parse-string (buffer-string) 'hcl))