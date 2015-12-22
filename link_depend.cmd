#!/bin/sh

PRJ_ROOT=/home/thanhpv/Workspace/VNG/code/Smart_SO
SCRIPT1=__link1.cmd

sh $SCRIPT1 $PRJ_ROOT/svn_zemalloc/zemalloc zemalloc
sh $SCRIPT1 $PRJ_ROOT/svn_xallocatorlib/xallocatorlib xallocatorlib
sh $SCRIPT1 $PRJ_ROOT/svn_zevent/zevent zevent
sh $SCRIPT1 $PRJ_ROOT/svn_zboost/zboost zboost
sh $SCRIPT1 $PRJ_ROOT/svn_xrpc/xrpc xrpc
sh $SCRIPT1 $PRJ_ROOT/svn_zpoco/zpoco zpoco
sh $SCRIPT1 $PRJ_ROOT/svn_zpoco/zpoco-zip zpoco-zip
sh $SCRIPT1 $PRJ_ROOT/svn_zidblib/zidblib zidblib
sh $SCRIPT1 $PRJ_ROOT/svn_zcommonlib/zcommonlib zcommonlib
sh $SCRIPT1 $PRJ_ROOT/svn_systemlibs/sigar sigar
sh $SCRIPT1 $PRJ_ROOT/svn_systemlibs/pcap pcap

