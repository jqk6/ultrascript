(module
 (type $iii (func (param i32 i32) (result i32)))
 (type $v (func))
 (global $~lib/internal/allocator/AL_BITS i32 (i32.const 3))
 (global $~lib/internal/allocator/AL_SIZE i32 (i32.const 8))
 (global $~lib/internal/allocator/AL_MASK i32 (i32.const 7))
 (global $~lib/internal/allocator/MAX_SIZE_32 i32 (i32.const 1073741824))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $export/a i32 (i32.const 1))
 (global $export/b i32 (i32.const 2))
 (global $export/c i32 (i32.const 3))
 (global $HEAP_BASE i32 (i32.const 8))
 (memory $0 0)
 (export "memory" (memory $0))
 (start $start)
 (func $export/add (; 0 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (get_local $0)
   (get_local $1)
  )
 )
 (func $export/sub (; 1 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (i32.sub
   (get_local $0)
   (get_local $1)
  )
 )
 (func $export/mul (; 2 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (i32.mul
   (get_local $0)
   (get_local $1)
  )
 )
 (func $export/ns.two (; 3 ;) (type $v)
  (nop)
 )
 (func $start (; 4 ;) (type $v)
  (set_global $~lib/allocator/arena/startOffset
   (i32.and
    (i32.add
     (get_global $HEAP_BASE)
     (get_global $~lib/internal/allocator/AL_MASK)
    )
    (i32.xor
     (get_global $~lib/internal/allocator/AL_MASK)
     (i32.const -1)
    )
   )
  )
  (set_global $~lib/allocator/arena/offset
   (get_global $~lib/allocator/arena/startOffset)
  )
  (drop
   (i32.add
    (i32.add
     (call $export/add
      (get_global $export/a)
      (get_global $export/b)
     )
     (call $export/sub
      (get_global $export/b)
      (get_global $export/c)
     )
    )
    (call $export/mul
     (get_global $export/c)
     (get_global $export/a)
    )
   )
  )
  (call $export/ns.two)
  (drop
   (i32.add
    (i32.add
     (call $export/add
      (get_global $export/a)
      (get_global $export/b)
     )
     (call $export/sub
      (get_global $export/b)
      (get_global $export/c)
     )
    )
    (call $export/mul
     (get_global $export/c)
     (get_global $export/a)
    )
   )
  )
  (call $export/ns.two)
 )
)
