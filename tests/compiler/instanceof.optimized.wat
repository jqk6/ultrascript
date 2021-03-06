(module
 (type $ii (func (param i32) (result i32)))
 (type $v (func))
 (type $Fi (func (param f64) (result i32)))
 (import "env" "abort" (func $~lib/env/abort))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $instanceof/d (mut i32) (i32.const 0))
 (global $instanceof/an (mut i32) (i32.const 0))
 (memory $0 1)
 (data (i32.const 8) "\0d\00\00\00i\00n\00s\00t\00a\00n\00c\00e\00o\00f\00.\00t\00s")
 (export "memory" (memory $0))
 (start $start)
 (func $~lib/allocator/arena/__memory_allocate (; 1 ;) (; has Stack IR ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (if
   (i32.gt_u
    (get_local $0)
    (i32.const 1073741824)
   )
   (unreachable)
  )
  (if
   (i32.gt_u
    (tee_local $2
     (i32.and
      (i32.add
       (i32.add
        (tee_local $1
         (get_global $~lib/allocator/arena/offset)
        )
        (select
         (get_local $0)
         (i32.const 1)
         (i32.gt_u
          (get_local $0)
          (i32.const 1)
         )
        )
       )
       (i32.const 7)
      )
      (i32.const -8)
     )
    )
    (i32.shl
     (tee_local $3
      (current_memory)
     )
     (i32.const 16)
    )
   )
   (if
    (i32.lt_s
     (grow_memory
      (select
       (get_local $3)
       (tee_local $0
        (i32.shr_u
         (i32.and
          (i32.add
           (i32.sub
            (get_local $2)
            (get_local $1)
           )
           (i32.const 65535)
          )
          (i32.const -65536)
         )
         (i32.const 16)
        )
       )
       (i32.gt_s
        (get_local $3)
        (get_local $0)
       )
      )
     )
     (i32.const 0)
    )
    (if
     (i32.lt_s
      (grow_memory
       (get_local $0)
      )
      (i32.const 0)
     )
     (unreachable)
    )
   )
  )
  (set_global $~lib/allocator/arena/offset
   (get_local $2)
  )
  (get_local $1)
 )
 (func $~lib/memory/memory.allocate (; 2 ;) (; has Stack IR ;) (type $ii) (param $0 i32) (result i32)
  (call $~lib/allocator/arena/__memory_allocate
   (get_local $0)
  )
 )
 (func $instanceof/isI32<i32> (; 3 ;) (; has Stack IR ;) (type $ii) (param $0 i32) (result i32)
  (i32.const 1)
 )
 (func $instanceof/isI32<f64> (; 4 ;) (; has Stack IR ;) (type $Fi) (param $0 f64) (result i32)
  (i32.const 0)
 )
 (func $instanceof/isI32<u32> (; 5 ;) (; has Stack IR ;) (type $ii) (param $0 i32) (result i32)
  (i32.const 0)
 )
 (func $start (; 6 ;) (; has Stack IR ;) (type $v)
  (set_global $~lib/allocator/arena/startOffset
   (i32.const 40)
  )
  (set_global $~lib/allocator/arena/offset
   (get_global $~lib/allocator/arena/startOffset)
  )
  (set_global $instanceof/d
   (call $~lib/memory/memory.allocate
    (i32.const 0)
   )
  )
  (if
   (i32.eqz
    (call $instanceof/isI32<i32>
     (i32.const 0)
    )
   )
   (block
    (call $~lib/env/abort)
    (unreachable)
   )
  )
  (if
   (call $instanceof/isI32<f64>
    (f64.const 0)
   )
   (block
    (call $~lib/env/abort)
    (unreachable)
   )
  )
  (if
   (call $instanceof/isI32<u32>
    (i32.const 0)
   )
   (block
    (call $~lib/env/abort)
    (unreachable)
   )
  )
  (if
   (get_global $instanceof/an)
   (block
    (call $~lib/env/abort)
    (unreachable)
   )
  )
  (set_global $instanceof/an
   (i32.const 1)
  )
  (if
   (i32.eqz
    (get_global $instanceof/an)
   )
   (block
    (call $~lib/env/abort)
    (unreachable)
   )
  )
 )
)
