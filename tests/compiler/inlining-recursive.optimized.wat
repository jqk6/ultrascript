(module
 (type $v (func))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (memory $0 0)
 (export "memory" (memory $0))
 (export "foo" (func $inlining-recursive/foo))
 (export "bar" (func $inlining-recursive/bar))
 (export "baz" (func $inlining-recursive/baz))
 (start $start)
 (func $inlining-recursive/foo (; 0 ;) (; has Stack IR ;) (type $v)
  (call $inlining-recursive/foo)
 )
 (func $inlining-recursive/baz (; 1 ;) (; has Stack IR ;) (type $v)
  (call $inlining-recursive/bar)
 )
 (func $inlining-recursive/bar (; 2 ;) (; has Stack IR ;) (type $v)
  (call $inlining-recursive/baz)
 )
 (func $start (; 3 ;) (; has Stack IR ;) (type $v)
  (set_global $~lib/allocator/arena/startOffset
   (i32.const 8)
  )
  (set_global $~lib/allocator/arena/offset
   (get_global $~lib/allocator/arena/startOffset)
  )
 )
)
