(module
 (type $iiii (func (param i32 i32 i32) (result i32)))
 (type $ii (func (param i32) (result i32)))
 (type $iiv (func (param i32 i32)))
 (type $IIIIv (func (param i64 i64 i64 i64)))
 (global $HEAP_BASE i32 (i32.const 8))
 (memory $0 0)
 (export "memory" (memory $0))
 (export "Concrete#constructor" (func $class-super/Concrete#constructor))
 (export "Concrete#get:a" (func $Concrete#get:a))
 (export "Concrete#set:a" (func $Concrete#set:a))
 (export "Concrete#_super" (func $class-super/Concrete#_super))
 (export "ConcreteA#get:a" (func $ConcreteA#get:a))
 (export "ConcreteA#set:a" (func $ConcreteA#set:a))
 (export "ConcreteB#constructor" (func $class-super/ConcreteB#constructor))
 (export "ConcreteB#get:a" (func $ConcreteB#get:a))
 (export "ConcreteB#set:a" (func $ConcreteB#set:a))
 (export "ConcreteB#_super" (func $class-super/ConcreteB#_super))
 (export "ConcreteC#constructor" (func $class-super/ConcreteC#constructor))
 (export "ConcreteC#get:a" (func $ConcreteC#get:a))
 (export "ConcreteC#set:a" (func $ConcreteC#set:a))
 (export "ConcreteC#_super" (func $class-super/ConcreteC#_super))
 (export "apply" (func $class-super/apply))
 (func $~lib/memory/memory.allocate (; 0 ;) (type $ii) (param $0 i32) (result i32)
  (unreachable)
 )
 (func $class-super/Concrete#_super (; 1 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $class-super/Concrete#constructor (; 2 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (call $class-super/Concrete#_super
   (tee_local $0
    (if (result i32)
     (get_local $0)
     (get_local $0)
     (tee_local $0
      (block (result i32)
       (set_local $3
        (call $~lib/memory/memory.allocate
         (i32.const 4)
        )
       )
       (i32.store
        (get_local $3)
        (i32.const 0)
       )
       (get_local $3)
      )
     )
    )
   )
   (get_local $1)
  )
  (get_local $0)
 )
 (func $class-super/ConcreteB#_super (; 3 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $class-super/ConcreteB#constructor (; 4 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (call $class-super/ConcreteB#_super
   (tee_local $0
    (if (result i32)
     (get_local $0)
     (get_local $0)
     (tee_local $0
      (block (result i32)
       (set_local $1
        (call $~lib/memory/memory.allocate
         (i32.const 4)
        )
       )
       (i32.store
        (get_local $1)
        (i32.const 0)
       )
       (get_local $1)
      )
     )
    )
   )
   (i32.const 12)
  )
  (get_local $0)
 )
 (func $class-super/ConcreteC#_super (; 5 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $class-super/ConcreteC#constructor (; 6 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (call $class-super/ConcreteC#_super
   (tee_local $0
    (if (result i32)
     (get_local $0)
     (get_local $0)
     (tee_local $0
      (block (result i32)
       (set_local $1
        (call $~lib/memory/memory.allocate
         (i32.const 4)
        )
       )
       (i32.store
        (get_local $1)
        (i32.const 0)
       )
       (get_local $1)
      )
     )
    )
   )
   (i32.const 12)
  )
  (set_local $1
   (i32.const 12)
  )
  (get_local $0)
 )
 (func $class-super/apply (; 7 ;) (type $IIIIv) (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64)
  (nop)
 )
 (func $Concrete#get:a (; 8 ;) (type $ii) (param $0 i32) (result i32)
  (i32.load
   (get_local $0)
  )
 )
 (func $Concrete#set:a (; 9 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $ConcreteA#get:a (; 10 ;) (type $ii) (param $0 i32) (result i32)
  (i32.load
   (get_local $0)
  )
 )
 (func $ConcreteA#set:a (; 11 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $ConcreteB#get:a (; 12 ;) (type $ii) (param $0 i32) (result i32)
  (i32.load
   (get_local $0)
  )
 )
 (func $ConcreteB#set:a (; 13 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $ConcreteC#get:a (; 14 ;) (type $ii) (param $0 i32) (result i32)
  (i32.load
   (get_local $0)
  )
 )
 (func $ConcreteC#set:a (; 15 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (get_local $1)
  )
 )
)
