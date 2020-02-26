-- Math 52: Week 7

import .utils
open classical

definition is_even (n : ℤ) : Prop := ∃ (k : ℤ), n = 2 * k

definition is_odd (n : ℤ) : Prop := ∃ (k : ℤ), n = 2 * k + 1

definition divides (a b : ℤ) : Prop := ∃ (n : ℤ), b = a * n

local infix ∣ := divides

-- We will prove these two basic facts later in the course.
axiom is_not_even_iff_is_odd (n : ℤ) : ¬ is_even n ↔ is_odd n
axiom is_not_odd_iff_is_even (n : ℤ) : ¬ is_even n ↔ is_odd n

theorem one_is_not_even : ¬ is_even 1 :=
begin
rw is_not_even_iff_is_odd,
unfold is_odd,
existsi (0 : ℤ),
refl,
end

-- The next theorem is easier to prove in the contrapositive form.
-- To do this, use the `by_contrapositive` tactic, which has the
-- the following effect:
example (P Q : Prop) : P → Q :=
begin
by_contrapositive,
sorry
end
-- Try to prove the theorem directly first, to see where you get 
-- stuck.

-- Theorem 2.2.3: For all n ∈ ℤ, if n² is odd then n is odd.
theorem T223 : ∀ (n : ℤ), is_odd (n * n) → is_odd n :=
begin
sorry
end
-- Proof. Let n ∈ ℤ be arbitrary. We prove the contrapositive.
-- Assume that n is even; we show that n² is also even.
--
-- Since n is even, by definition we may fix k ∈ ℤ such that n = 2k. 
-- Then 
---  n² = (2k)² = 4k² = 2(2k²),
-- and hence n² is even, also by definition.
--
-- Therefore, if n² is odd, then n is odd. 􏰟

-- Theorem 2.2.4: For all n ∈ ℤ, if n² is even then n is even.
theorem T224 : ∀ (n : ℤ), is_even (n * n) → is_even n :=
begin
sorry
end

-- The next theorem is a negative statement, which is proved by
-- contradiction. If we assume that there are integers m and n
-- such that 8m + 26n = 1 then we obtain the absurd conclusion
-- that 1 is even.

-- Lakins 2.2.3: There are no integers m and n such that 8m + 26n = 1.
theorem L223 : ¬ ∃ (m n : ℤ), 8*m + 26*n = 1 :=
begin
intro H,
apply one_is_not_even,
sorry
end
