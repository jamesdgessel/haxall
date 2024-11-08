//
// Copyright (c) 2024, Brian Frank
// Licensed under the Academic Free License version 3.0
//
// History:
//   5 Nov 2024  Brian Frank  Creation
//

using xeto
using util

**
** CNamespace is common API shared by MLibnamespace and XetoCompiler
**
@Js
mixin CNamespace
{
  ** Iterate each subtype of given type that returns true for 'isa(type)'
  abstract Void eachSubtype(CSpec type, |CSpec| f)
}
