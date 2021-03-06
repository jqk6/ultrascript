(module
 (type $FFFi (func (param f64 f64 f64) (result i32)))
 (type $FFF (func (param f64 f64) (result f64)))
 (type $FFi (func (param f64 f64) (result i32)))
 (type $Fi (func (param f64) (result i32)))
 (type $v (func))
 (type $fffi (func (param f32 f32 f32) (result i32)))
 (type $fff (func (param f32 f32) (result f32)))
 (type $ffi (func (param f32 f32) (result i32)))
 (type $fi (func (param f32) (result i32)))
 (import "JSOp" "mod" (func $std/mod/JSOp.mod (param f64 f64) (result f64)))
 (import "env" "abort" (func $~lib/env/abort))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (memory $0 1)
 (data (i32.const 8) "\n\00\00\00s\00t\00d\00/\00m\00o\00d\00.\00t\00s")
 (export "memory" (memory $0))
 (start $start)
 (func $~lib/math/NativeMath.mod (; 2 ;) (; has Stack IR ;) (type $FFF) (param $0 f64) (param $1 f64) (result f64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (block $folding-inner0
   (set_local $3
    (i32.wrap/i64
     (i64.and
      (i64.shr_u
       (tee_local $2
        (i64.reinterpret/f64
         (get_local $0)
        )
       )
       (i64.const 52)
      )
      (i64.const 2047)
     )
    )
   )
   (set_local $6
    (i32.wrap/i64
     (i64.and
      (i64.shr_u
       (tee_local $5
        (i64.reinterpret/f64
         (get_local $1)
        )
       )
       (i64.const 52)
      )
      (i64.const 2047)
     )
    )
   )
   (set_local $8
    (i32.wrap/i64
     (i64.shr_u
      (get_local $2)
      (i64.const 63)
     )
    )
   )
   (if
    (i32.eqz
     (tee_local $7
      (i64.eq
       (i64.shl
        (get_local $5)
        (i64.const 1)
       )
       (i64.const 0)
      )
     )
    )
    (set_local $7
     (f64.ne
      (get_local $1)
      (get_local $1)
     )
    )
   )
   (if
    (i32.eqz
     (get_local $7)
    )
    (set_local $7
     (i32.eq
      (get_local $3)
      (i32.const 2047)
     )
    )
   )
   (if
    (get_local $7)
    (return
     (f64.div
      (tee_local $0
       (f64.mul
        (get_local $0)
        (get_local $1)
       )
      )
      (get_local $0)
     )
    )
   )
   (if
    (i64.le_u
     (i64.shl
      (get_local $2)
      (i64.const 1)
     )
     (i64.shl
      (get_local $5)
      (i64.const 1)
     )
    )
    (block
     (br_if $folding-inner0
      (i64.eq
       (i64.shl
        (get_local $2)
        (i64.const 1)
       )
       (i64.shl
        (get_local $5)
        (i64.const 1)
       )
      )
     )
     (return
      (get_local $0)
     )
    )
   )
   (set_local $2
    (if (result i64)
     (get_local $3)
     (i64.or
      (i64.and
       (get_local $2)
       (i64.const 4503599627370495)
      )
      (i64.const 4503599627370496)
     )
     (block (result i64)
      (block $break|0
       (set_local $4
        (i64.shl
         (get_local $2)
         (i64.const 12)
        )
       )
       (loop $repeat|0
        (br_if $break|0
         (i32.eqz
          (i64.eqz
           (i64.shr_u
            (get_local $4)
            (i64.const 63)
           )
          )
         )
        )
        (set_local $3
         (i32.sub
          (get_local $3)
          (i32.const 1)
         )
        )
        (set_local $4
         (i64.shl
          (get_local $4)
          (i64.const 1)
         )
        )
        (br $repeat|0)
       )
      )
      (i64.shl
       (get_local $2)
       (i64.extend_u/i32
        (i32.sub
         (i32.const 1)
         (get_local $3)
        )
       )
      )
     )
    )
   )
   (set_local $5
    (if (result i64)
     (get_local $6)
     (i64.or
      (i64.and
       (get_local $5)
       (i64.const 4503599627370495)
      )
      (i64.const 4503599627370496)
     )
     (block (result i64)
      (block $break|1
       (set_local $4
        (i64.shl
         (get_local $5)
         (i64.const 12)
        )
       )
       (loop $repeat|1
        (br_if $break|1
         (i32.eqz
          (i64.eqz
           (i64.shr_u
            (get_local $4)
            (i64.const 63)
           )
          )
         )
        )
        (set_local $6
         (i32.sub
          (get_local $6)
          (i32.const 1)
         )
        )
        (set_local $4
         (i64.shl
          (get_local $4)
          (i64.const 1)
         )
        )
        (br $repeat|1)
       )
      )
      (i64.shl
       (get_local $5)
       (i64.extend_u/i32
        (i32.sub
         (i32.const 1)
         (get_local $6)
        )
       )
      )
     )
    )
   )
   (block $break|2
    (loop $repeat|2
     (br_if $break|2
      (i32.le_s
       (get_local $3)
       (get_local $6)
      )
     )
     (if
      (i64.eqz
       (i64.shr_u
        (tee_local $4
         (i64.sub
          (get_local $2)
          (get_local $5)
         )
        )
        (i64.const 63)
       )
      )
      (block
       (br_if $folding-inner0
        (i64.eqz
         (get_local $4)
        )
       )
       (set_local $2
        (get_local $4)
       )
      )
     )
     (set_local $2
      (i64.shl
       (get_local $2)
       (i64.const 1)
      )
     )
     (set_local $3
      (i32.sub
       (get_local $3)
       (i32.const 1)
      )
     )
     (br $repeat|2)
    )
   )
   (if
    (i64.eqz
     (i64.shr_u
      (tee_local $4
       (i64.sub
        (get_local $2)
        (get_local $5)
       )
      )
      (i64.const 63)
     )
    )
    (block
     (br_if $folding-inner0
      (i64.eqz
       (get_local $4)
      )
     )
     (set_local $2
      (get_local $4)
     )
    )
   )
   (block $break|3
    (loop $repeat|3
     (br_if $break|3
      (i32.eqz
       (i64.eqz
        (i64.shr_u
         (get_local $2)
         (i64.const 52)
        )
       )
      )
     )
     (set_local $3
      (i32.sub
       (get_local $3)
       (i32.const 1)
      )
     )
     (set_local $2
      (i64.shl
       (get_local $2)
       (i64.const 1)
      )
     )
     (br $repeat|3)
    )
   )
   (return
    (f64.reinterpret/i64
     (i64.or
      (tee_local $2
       (if (result i64)
        (i32.gt_s
         (get_local $3)
         (i32.const 0)
        )
        (i64.or
         (i64.sub
          (get_local $2)
          (i64.const 4503599627370496)
         )
         (i64.shl
          (i64.extend_u/i32
           (get_local $3)
          )
          (i64.const 52)
         )
        )
        (i64.shr_u
         (get_local $2)
         (i64.extend_u/i32
          (i32.sub
           (i32.const 1)
           (get_local $3)
          )
         )
        )
       )
      )
      (i64.shl
       (i64.extend_u/i32
        (get_local $8)
       )
       (i64.const 63)
      )
     )
    )
   )
  )
  (f64.mul
   (f64.const 0)
   (get_local $0)
  )
 )
 (func $~lib/builtins/isNaN<f64> (; 3 ;) (; has Stack IR ;) (type $Fi) (param $0 f64) (result i32)
  (f64.ne
   (get_local $0)
   (get_local $0)
  )
 )
 (func $std/mod/check<f64> (; 4 ;) (; has Stack IR ;) (type $FFi) (param $0 f64) (param $1 f64) (result i32)
  (if
   (call $~lib/builtins/isNaN<f64>
    (get_local $1)
   )
   (return
    (call $~lib/builtins/isNaN<f64>
     (get_local $0)
    )
   )
  )
  (if
   (f64.eq
    (get_local $1)
    (f64.const 0)
   )
   (return
    (f64.eq
     (f64.div
      (f64.const 1)
      (get_local $1)
     )
     (f64.div
      (f64.const 1)
      (get_local $0)
     )
    )
   )
  )
  (f64.eq
   (get_local $0)
   (get_local $1)
  )
 )
 (func $std/mod/test_fmod (; 5 ;) (; has Stack IR ;) (type $FFFi) (param $0 f64) (param $1 f64) (param $2 f64) (result i32)
  (local $3 i32)
  (if
   (tee_local $3
    (call $std/mod/check<f64>
     (call $~lib/math/NativeMath.mod
      (get_local $0)
      (get_local $1)
     )
     (get_local $2)
    )
   )
   (set_local $3
    (call $std/mod/check<f64>
     (tee_local $0
      (call $std/mod/JSOp.mod
       (get_local $0)
       (get_local $1)
      )
     )
     (get_local $2)
    )
   )
  )
  (get_local $3)
 )
 (func $~lib/math/NativeMathf.mod (; 6 ;) (; has Stack IR ;) (type $fff) (param $0 f32) (param $1 f32) (result f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $folding-inner0
   (set_local $4
    (i32.and
     (i32.shr_u
      (tee_local $2
       (i32.reinterpret/f32
        (get_local $0)
       )
      )
      (i32.const 23)
     )
     (i32.const 255)
    )
   )
   (set_local $6
    (i32.and
     (i32.shr_u
      (tee_local $5
       (i32.reinterpret/f32
        (get_local $1)
       )
      )
      (i32.const 23)
     )
     (i32.const 255)
    )
   )
   (set_local $7
    (i32.and
     (get_local $2)
     (i32.const -2147483648)
    )
   )
   (if
    (i32.eqz
     (tee_local $3
      (i32.eqz
       (i32.shl
        (get_local $5)
        (i32.const 1)
       )
      )
     )
    )
    (set_local $3
     (f32.ne
      (get_local $1)
      (get_local $1)
     )
    )
   )
   (if
    (i32.eqz
     (i32.and
      (get_local $3)
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.eq
      (get_local $4)
      (i32.const 255)
     )
    )
   )
   (if
    (i32.and
     (get_local $3)
     (i32.const 1)
    )
    (return
     (f32.div
      (tee_local $0
       (f32.mul
        (get_local $0)
        (get_local $1)
       )
      )
      (get_local $0)
     )
    )
   )
   (if
    (i32.le_u
     (i32.shl
      (get_local $2)
      (i32.const 1)
     )
     (i32.shl
      (get_local $5)
      (i32.const 1)
     )
    )
    (block
     (br_if $folding-inner0
      (i32.eq
       (i32.shl
        (get_local $2)
        (i32.const 1)
       )
       (i32.shl
        (get_local $5)
        (i32.const 1)
       )
      )
     )
     (return
      (get_local $0)
     )
    )
   )
   (set_local $2
    (if (result i32)
     (get_local $4)
     (i32.or
      (i32.and
       (get_local $2)
       (i32.const 8388607)
      )
      (i32.const 8388608)
     )
     (block (result i32)
      (block $break|0
       (set_local $3
        (i32.shl
         (get_local $2)
         (i32.const 9)
        )
       )
       (loop $repeat|0
        (br_if $break|0
         (i32.shr_u
          (get_local $3)
          (i32.const 31)
         )
        )
        (set_local $4
         (i32.sub
          (get_local $4)
          (i32.const 1)
         )
        )
        (set_local $3
         (i32.shl
          (get_local $3)
          (i32.const 1)
         )
        )
        (br $repeat|0)
       )
      )
      (i32.shl
       (get_local $2)
       (i32.sub
        (i32.const 1)
        (get_local $4)
       )
      )
     )
    )
   )
   (set_local $5
    (if (result i32)
     (get_local $6)
     (i32.or
      (i32.and
       (get_local $5)
       (i32.const 8388607)
      )
      (i32.const 8388608)
     )
     (block (result i32)
      (block $break|1
       (set_local $3
        (i32.shl
         (get_local $5)
         (i32.const 9)
        )
       )
       (loop $repeat|1
        (br_if $break|1
         (i32.shr_u
          (get_local $3)
          (i32.const 31)
         )
        )
        (set_local $6
         (i32.sub
          (get_local $6)
          (i32.const 1)
         )
        )
        (set_local $3
         (i32.shl
          (get_local $3)
          (i32.const 1)
         )
        )
        (br $repeat|1)
       )
      )
      (i32.shl
       (get_local $5)
       (i32.sub
        (i32.const 1)
        (get_local $6)
       )
      )
     )
    )
   )
   (block $break|2
    (loop $repeat|2
     (br_if $break|2
      (i32.le_s
       (get_local $4)
       (get_local $6)
      )
     )
     (if
      (i32.eqz
       (i32.shr_u
        (tee_local $3
         (i32.sub
          (get_local $2)
          (get_local $5)
         )
        )
        (i32.const 31)
       )
      )
      (block
       (br_if $folding-inner0
        (i32.eqz
         (get_local $3)
        )
       )
       (set_local $2
        (get_local $3)
       )
      )
     )
     (set_local $2
      (i32.shl
       (get_local $2)
       (i32.const 1)
      )
     )
     (set_local $4
      (i32.sub
       (get_local $4)
       (i32.const 1)
      )
     )
     (br $repeat|2)
    )
   )
   (if
    (i32.eqz
     (i32.shr_u
      (tee_local $3
       (i32.sub
        (get_local $2)
        (get_local $5)
       )
      )
      (i32.const 31)
     )
    )
    (block
     (br_if $folding-inner0
      (i32.eqz
       (get_local $3)
      )
     )
     (set_local $2
      (get_local $3)
     )
    )
   )
   (block $break|3
    (loop $repeat|3
     (br_if $break|3
      (i32.shr_u
       (get_local $2)
       (i32.const 23)
      )
     )
     (set_local $4
      (i32.sub
       (get_local $4)
       (i32.const 1)
      )
     )
     (set_local $2
      (i32.shl
       (get_local $2)
       (i32.const 1)
      )
     )
     (br $repeat|3)
    )
   )
   (return
    (f32.reinterpret/i32
     (i32.or
      (tee_local $2
       (if (result i32)
        (i32.gt_s
         (get_local $4)
         (i32.const 0)
        )
        (i32.or
         (i32.sub
          (get_local $2)
          (i32.const 8388608)
         )
         (i32.shl
          (get_local $4)
          (i32.const 23)
         )
        )
        (i32.shr_u
         (get_local $2)
         (i32.sub
          (i32.const 1)
          (get_local $4)
         )
        )
       )
      )
      (get_local $7)
     )
    )
   )
  )
  (f32.mul
   (f32.const 0)
   (get_local $0)
  )
 )
 (func $~lib/builtins/isNaN<f32> (; 7 ;) (; has Stack IR ;) (type $fi) (param $0 f32) (result i32)
  (f32.ne
   (get_local $0)
   (get_local $0)
  )
 )
 (func $std/mod/check<f32> (; 8 ;) (; has Stack IR ;) (type $ffi) (param $0 f32) (param $1 f32) (result i32)
  (if
   (call $~lib/builtins/isNaN<f32>
    (get_local $1)
   )
   (return
    (call $~lib/builtins/isNaN<f32>
     (get_local $0)
    )
   )
  )
  (if
   (f32.eq
    (get_local $1)
    (f32.const 0)
   )
   (return
    (f32.eq
     (f32.div
      (f32.const 1)
      (get_local $1)
     )
     (f32.div
      (f32.const 1)
      (get_local $0)
     )
    )
   )
  )
  (f32.eq
   (get_local $0)
   (get_local $1)
  )
 )
 (func $std/mod/test_fmodf (; 9 ;) (; has Stack IR ;) (type $fffi) (param $0 f32) (param $1 f32) (param $2 f32) (result i32)
  (call $std/mod/check<f32>
   (call $~lib/math/NativeMathf.mod
    (get_local $0)
    (get_local $1)
   )
   (get_local $2)
  )
 )
 (func $start (; 10 ;) (; has Stack IR ;) (type $v)
  (block $folding-inner0
   (set_global $~lib/allocator/arena/startOffset
    (i32.const 32)
   )
   (set_global $~lib/allocator/arena/offset
    (get_global $~lib/allocator/arena/startOffset)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 3)
      (f64.const 2)
      (f64.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 3)
      (f64.const -2)
      (f64.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -3)
      (f64.const 2)
      (f64.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -3)
      (f64.const -2)
      (f64.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 3.5)
      (f64.const 2)
      (f64.const 1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 3.5)
      (f64.const -2)
      (f64.const 1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -3.5)
      (f64.const 2)
      (f64.const -1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -3.5)
      (f64.const -2)
      (f64.const -1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 3)
      (f64.const 2.5)
      (f64.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 3)
      (f64.const -2.5)
      (f64.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -3)
      (f64.const 2.5)
      (f64.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -3)
      (f64.const -2.5)
      (f64.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0.5)
      (f64.const 1)
      (f64.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0.5)
      (f64.const -1)
      (f64.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0.5)
      (f64.const 1)
      (f64.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0.5)
      (f64.const -1)
      (f64.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1.5)
      (f64.const 1)
      (f64.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1.5)
      (f64.const -1)
      (f64.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1.5)
      (f64.const 1)
      (f64.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1.5)
      (f64.const -1)
      (f64.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1.25)
      (f64.const 1)
      (f64.const 0.25)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1.25)
      (f64.const -1)
      (f64.const 0.25)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1.25)
      (f64.const 1)
      (f64.const -0.25)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1.25)
      (f64.const -1)
      (f64.const -0.25)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1)
      (f64.const 1.25)
      (f64.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1)
      (f64.const -1.25)
      (f64.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1)
      (f64.const 1.25)
      (f64.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1)
      (f64.const -1.25)
      (f64.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -13)
      (f64.const 64)
      (f64.const -13)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0)
      (f64.const 1)
      (f64.const 0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0)
      (f64.const 1)
      (f64.const -0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0)
      (f64.const -1)
      (f64.const 0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0)
      (f64.const -1)
      (f64.const -0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const 1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const -1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const 1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const -1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const nan:0x8000000000000)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0)
      (f64.const inf)
      (f64.const 0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0)
      (f64.const inf)
      (f64.const -0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 0)
      (f64.const -inf)
      (f64.const 0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -0)
      (f64.const -inf)
      (f64.const -0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1)
      (f64.const inf)
      (f64.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1)
      (f64.const inf)
      (f64.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const 1)
      (f64.const -inf)
      (f64.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -1)
      (f64.const -inf)
      (f64.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const 0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const -0)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const 1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const -1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const 1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const -1)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const inf)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const inf)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const -inf)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const -inf)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const inf)
      (f64.const nan:0x8000000000000)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const -inf)
      (f64.const nan:0x8000000000000)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const inf)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmod
      (f64.const nan:0x8000000000000)
      (f64.const -inf)
      (f64.const nan:0x8000000000000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 3)
      (f32.const 2)
      (f32.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 3)
      (f32.const -2)
      (f32.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -3)
      (f32.const 2)
      (f32.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -3)
      (f32.const -2)
      (f32.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 3.5)
      (f32.const 2)
      (f32.const 1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 3.5)
      (f32.const -2)
      (f32.const 1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -3.5)
      (f32.const 2)
      (f32.const -1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -3.5)
      (f32.const -2)
      (f32.const -1.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 3)
      (f32.const 2.5)
      (f32.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 3)
      (f32.const -2.5)
      (f32.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -3)
      (f32.const 2.5)
      (f32.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -3)
      (f32.const -2.5)
      (f32.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 0.5)
      (f32.const 1)
      (f32.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 0.5)
      (f32.const -1)
      (f32.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -0.5)
      (f32.const 1)
      (f32.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -0.5)
      (f32.const -1)
      (f32.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 1.5)
      (f32.const 1)
      (f32.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 1.5)
      (f32.const -1)
      (f32.const 0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -1.5)
      (f32.const 1)
      (f32.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -1.5)
      (f32.const -1)
      (f32.const -0.5)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 0)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -0)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 0)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -0)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 1)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -1)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 1)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -1)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const 1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const -1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const 1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const -1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const nan:0x400000)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 0)
      (f32.const inf)
      (f32.const 0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -0)
      (f32.const inf)
      (f32.const -0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 0)
      (f32.const -inf)
      (f32.const 0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -0)
      (f32.const -inf)
      (f32.const -0)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 1)
      (f32.const inf)
      (f32.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -1)
      (f32.const inf)
      (f32.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const 1)
      (f32.const -inf)
      (f32.const 1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -1)
      (f32.const -inf)
      (f32.const -1)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const 0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const -0)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const 1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const -1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const 1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const -1)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const inf)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const inf)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const -inf)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const -inf)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const inf)
      (f32.const nan:0x400000)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const -inf)
      (f32.const nan:0x400000)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const inf)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (if
    (i32.eqz
     (call $std/mod/test_fmodf
      (f32.const nan:0x400000)
      (f32.const -inf)
      (f32.const nan:0x400000)
     )
    )
    (br $folding-inner0)
   )
   (return)
  )
  (call $~lib/env/abort)
  (unreachable)
 )
)
