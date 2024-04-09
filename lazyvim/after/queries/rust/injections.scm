;; extends

;; tell treesitter that query! and query_as! string parameters are sql
(macro_invocation
  macro: (scoped_identifier
            path: (identifier) @path (#eq? @path "sqlx")
            name: (identifier) @name (#eq? @name "query_as"))
  (token_tree (string_literal) @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql") 
    (#set! injeciton.include-children true)
  )
)

(macro_invocation
  macro: (scoped_identifier
            path: (identifier) @path (#eq? @path "sqlx")
            name: (identifier) @name (#eq? @name "query"))
  (token_tree (string_literal) @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql") 
    (#set! injeciton.include-children true)
  )
)
