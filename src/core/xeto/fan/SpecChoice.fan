//
// Copyright (c) 2024, Brian Frank
// Licensed under the Academic Free License version 3.0
//
// History:
//   3 Nov 2024  Brian Frank  Creation
//

using util

**
** Choice APIs for a specific choice spec via `LibNamespace.choice`.
**
@Js
const mixin SpecChoice
{
  ** Spec for this choice - might be slot or choice type
  abstract Spec spec()

  ** Choice type for the spec
  abstract Spec type()

  ** Return if the choice slot allows zero selections
  abstract Bool isMaybe()

  ** Return if the choice slot allows multiple selections
  abstract Bool isMultiChoice()

  ** Return all choice selections the given instance implements.
  **   - one selection => return list of one
  **   - zero selections + isMaybe is true => return empty list
  **   - zero selections + isMaybe is false + checked is false => return empty list
  **   - zero selections + isMaybe is false + checked is true => raise exception
  **   - multiple selections + isMultiChoice is false + checked is false => return all
  **   - multiple selections + isMultiChoice is false + checked is true => raise exception
  **   - multiple selections + isMultiChoice is true + checked is true => return all
  abstract Spec[] selections(Dict instance, Bool checked := true)

  ** Return single choice selection considering validation rules.
  ** This method is a semantically equivalent to:
  **    selections(instance, checked).first
  abstract Spec? selection(Dict instance, Bool checked := true)
}

