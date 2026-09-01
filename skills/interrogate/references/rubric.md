# Interrogate rubric

Challenge the scoped change against the stated intent. Cite
`path:line`. No style nits unless they hide a real bug.

- **Fit.** Does the diff do what the intent said, and only that?
- **Invariant.** Is the named shape still true, or did this make an
  illegal state representable?
- **Cause.** Is this a root-cause patch, or a guard that hides the
  crash?
- **Proof.** Is there a path that would have failed before and
  passes after? A test nobody ran is not proof.
- **Size.** Could a smaller diff honor the same invariant?
- **Homes.** Did this copy a fact that already has an owner?
- **Safety.** Injection, authz, secret leak, data loss.
