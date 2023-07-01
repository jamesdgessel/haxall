//
// Copyright (c) 2023, Brian Frank
// Licensed under the Academic Free License version 3.0
//
// History:
//   23 Apr 2023  Brian Frank  Creation
//

**
** Registry of libs installed on local machine
**
@NoDoc @Js
const mixin LibRegistry
{
  ** List all installed libs
  abstract LibRegistryEntry[] list()

  ** Lookup installed lib
  abstract LibRegistryEntry? get(Str qname, Bool checked := true)

  ** Hook for build command to force re-compile
  abstract Int build(LibRegistryEntry[] libs)
}

**************************************************************************
** LibRegistryEntry
**************************************************************************

**
** Registry entry of a single lib installed on local machine
**
@NoDoc @Js
const mixin LibRegistryEntry
{
  ** Qualilfied name
  abstract Str qname()

  ** Has this library been loaded into memory
  abstract Bool isLoaded()

  ** Installed version
  abstract Version version()

  ** Summary information
  abstract Str doc()

  ** Xetolib zip file location
  abstract File zip()

  ** Is the source available in working dir
  abstract Bool isSrc()

  ** Source dir if available in working dir
  abstract File? srcDir(Bool checked := true)
}
