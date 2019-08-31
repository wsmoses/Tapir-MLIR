; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64--| FileCheck %s

define i32 @shl_and(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: shl_and:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shll $5, %eax
; CHECK-NEXT:    andl %esi, %eax
; CHECK-NEXT:    shll $7, %eax
; CHECK-NEXT:    retq
  %sh0 = shl i32 %x, 5
  %r = and i32 %sh0, %y
  %sh1 = shl i32 %r, 7
  ret i32 %sh1
}

define i32 @shl_or(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: shl_or:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shll $5, %eax
; CHECK-NEXT:    orl %esi, %eax
; CHECK-NEXT:    shll $7, %eax
; CHECK-NEXT:    retq
  %sh0 = shl i32 %x, 5
  %r = or i32 %y, %sh0
  %sh1 = shl i32 %r, 7
  ret i32 %sh1
}

define i32 @shl_xor(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: shl_xor:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shll $5, %eax
; CHECK-NEXT:    xorl %esi, %eax
; CHECK-NEXT:    shll $7, %eax
; CHECK-NEXT:    retq
  %sh0 = shl i32 %x, 5
  %r = xor i32 %sh0, %y
  %sh1 = shl i32 %r, 7
  ret i32 %sh1
}

define i32 @lshr_and(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: lshr_and:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shrl $5, %eax
; CHECK-NEXT:    andl %esi, %eax
; CHECK-NEXT:    shrl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = lshr i32 %x, 5
  %r = and i32 %y, %sh0
  %sh1 = lshr i32 %r, 7
  ret i32 %sh1
}

define i32 @lshr_or(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: lshr_or:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shrl $5, %eax
; CHECK-NEXT:    orl %esi, %eax
; CHECK-NEXT:    shrl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = lshr i32 %x, 5
  %r = or i32 %sh0, %y
  %sh1 = lshr i32 %r, 7
  ret i32 %sh1
}

define i32 @lshr_xor(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: lshr_xor:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shrl $5, %eax
; CHECK-NEXT:    xorl %esi, %eax
; CHECK-NEXT:    shrl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = lshr i32 %x, 5
  %r = xor i32 %y, %sh0
  %sh1 = lshr i32 %r, 7
  ret i32 %sh1
}


define i32 @ashr_and(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: ashr_and:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    sarl $5, %eax
; CHECK-NEXT:    andl %esi, %eax
; CHECK-NEXT:    sarl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = ashr i32 %x, 5
  %r = and i32 %y, %sh0
  %sh1 = ashr i32 %r, 7
  ret i32 %sh1
}

define i32 @ashr_or(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: ashr_or:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    sarl $5, %eax
; CHECK-NEXT:    orl %esi, %eax
; CHECK-NEXT:    sarl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = ashr i32 %x, 5
  %r = or i32 %sh0, %y
  %sh1 = ashr i32 %r, 7
  ret i32 %sh1
}

define i32 @ashr_xor(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: ashr_xor:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    sarl $5, %eax
; CHECK-NEXT:    xorl %esi, %eax
; CHECK-NEXT:    sarl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = ashr i32 %x, 5
  %r = xor i32 %y, %sh0
  %sh1 = ashr i32 %r, 7
  ret i32 %sh1
}

define i32 @shr_mismatch_xor(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: shr_mismatch_xor:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    sarl $5, %eax
; CHECK-NEXT:    xorl %esi, %eax
; CHECK-NEXT:    shrl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = ashr i32 %x, 5
  %r = xor i32 %y, %sh0
  %sh1 = lshr i32 %r, 7
  ret i32 %sh1
}

define i32 @ashr_overshift_xor(i32 %x, i32 %y) nounwind {
; CHECK-LABEL: ashr_overshift_xor:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    sarl $15, %eax
; CHECK-NEXT:    xorl %esi, %eax
; CHECK-NEXT:    sarl $17, %eax
; CHECK-NEXT:    retq
  %sh0 = ashr i32 %x, 15
  %r = xor i32 %y, %sh0
  %sh1 = ashr i32 %r, 17
  ret i32 %sh1
}

define i32 @lshr_or_extra_use(i32 %x, i32 %y, i32* %p) nounwind {
; CHECK-LABEL: lshr_or_extra_use:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    shrl $5, %eax
; CHECK-NEXT:    orl %esi, %eax
; CHECK-NEXT:    movl %eax, (%rdx)
; CHECK-NEXT:    shrl $7, %eax
; CHECK-NEXT:    retq
  %sh0 = lshr i32 %x, 5
  %r = or i32 %sh0, %y
  store i32 %r, i32* %p
  %sh1 = lshr i32 %r, 7
  ret i32 %sh1
}
