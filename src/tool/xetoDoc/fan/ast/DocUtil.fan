//
// Copyright (c) 2024, SkyFoundry LLC
// Licensed under the Academic Free License version 3.0
//
// History:
//   24 Sep 2024  Brian Frank  Creation
//

using xeto
using xetoEnv
using haystack::Ref

**
** Documentation utilities
**
@Js
const class DocUtil
{
  ** Lib name to the library index page
  static Uri libToUri(Str libName)
  {
    "/${libName}/index".toUri
  }

  ** Convert spec name to its normalized URI
  static Uri specToUri(Spec spec)
  {
    spec.isGlobal ? globalToUri(spec.qname) : typeToUri(spec.qname)
  }

  ** Convert type spec qualilfied name to its normalized URI
  static Uri typeToUri(Str qname)
  {
    qnameToUri(qname, false)
  }

  ** Convert global spec qualilfied name to its normalized URI
  static Uri globalToUri(Str qname)
  {
    qnameToUri(qname, true)
  }

  ** Convert instance qualified name to its normalized URI
  static Uri instanceToUri(Str qname)
  {
    qnameToUri(qname, false)
  }

  ** Convert spec or instance qualified name to its normalized URI
  private static Uri qnameToUri(Str qname, Bool isGlobal)
  {
    // TODO: we are going to have to deal with lower vs upper case names on file systems
    colons := qname.index("::") ?: throw Err("Not qname: $qname")
    s := StrBuf(qname.size + 3)
    return s.addChar('/')
            .addRange(qname, 0..<colons)
            .addChar('/')
            .add(isGlobal ? "_" : "")
            .addRange(qname, colons+2..-1)
            .toStr.toUri
  }

  // Standard icon refs

  static const Ref libIcon      := Ref("ion.icons::package")
  static const Ref typeIcon     := Ref("ion.icons::aperture")
  static const Ref globalIcon   := Ref("ion.icons::tag")
  static const Ref instanceIcon := Ref("ion.icons::at-sign")
}
