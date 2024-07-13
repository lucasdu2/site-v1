#lang pollen

◊(require pollen/pagetree)
◊(require racket/symbol)

◊(define (node-link node)
   (define node-string (symbol->immutable-string node))
   (define link-name
     (let* ([name (car (select-from-doc 'h1 (get-doc node-string)))])
       name))
   (define link-date
     (let* ([date (car (select-from-doc 'post-date (get-doc node-string)))])
       date))
   ◊post-item[link-date node-string]{◊link-name})

◊(define posts-list (children 'posts.html (get-pagetree "index.ptree")))
◊(define (construct-posts-toc plist)
   ◊(if plist
        (apply post-list (map node-link plist))
        ""))

◊; TODO: Write script to automatically create a new post with the
◊; proper date and name -- add to posts.ptree, or automatically create posts.ptree.
◊headline{Posts}
◊(construct-posts-toc posts-list)
