# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::UNIVERSAL;

# this class is needed for perl inheritance
sub AUTOLOAD {
  die("[Error: Missing Function] $AUTOLOAD @_\n");
}
