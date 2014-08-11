#!/bin/bash

#. benchmark.sh web-google-single 4 0 false EdgePartition2D
#. benchmark.sh web-google-single 4 0 false EdgePartition1D
#. benchmark.sh web-google-single 4 0 false RandomVertexCut
#. benchmark.sh web-google-single 4 0 false CanonicalRandomVertexCut

#. benchmark.sh web-google-single 4 0 true HybridCut
#. benchmark.sh web-google-single 4 70 true HybridCut
#. benchmark.sh web-google-single 4 875713 true HybridCut
#. benchmark.sh web-google-single 4 0 true EdgePartition2D
#. benchmark.sh web-google-single 4 0 true EdgePartition1D
#. benchmark.sh web-google-single 4 0 true RandomVertexCut
#. benchmark.sh web-google-single 4 0 true CanonicalRandomVertexCut

#. benchmark.sh web-google-single 6 0 true EdgePartition2D
#. benchmark.sh web-google-single 6 0 true EdgePartition1D
#. benchmark.sh web-google-single 6 0 true RandomVertexCut
#. benchmark.sh web-google-single 6 0 true CanonicalRandomVertexCut
#. benchmark.sh web-google-single 6 0 true HybridCut
#. benchmark.sh web-google-single 6 70 true HybridCut
#. benchmark.sh web-google-single 6 875713 true HybridCut

#. benchmark.sh in-2.0-1m 4 0 true HybridCut
#. benchmark.sh in-2.0-1m 4 70 true HybridCut
#. benchmark.sh in-2.0-1m 4 1000000 true HybridCut

#. benchmark.sh in-2.0-1m 9 0 false HybridCut
#. benchmark.sh in-2.0-1m 9 100 false HybridCut
#. benchmark.sh in-2.0-1m 9 1000000 false HybridCut
#. benchmark.sh in-2.0-1m 9 0 false EdgePartition2D
#. benchmark.sh in-2.0-1m 9 0 false EdgePartition1D
#. benchmark.sh in-2.0-1m 9 0 false RandomVertexCut
#. benchmark.sh in-2.0-1m 9 0 false CanonicalRandomVertexCut
#
#. benchmark.sh in-2.0-1m 10 0 false HybridCut
#. benchmark.sh in-2.0-1m 10 100 false HybridCut
#. benchmark.sh in-2.0-1m 10 1000000 false HybridCut
#. benchmark.sh in-2.0-1m 10 0 false EdgePartition2D
#. benchmark.sh in-2.0-1m 10 0 false EdgePartition1D
#. benchmark.sh in-2.0-1m 10 0 false RandomVertexCut
#. benchmark.sh in-2.0-1m 10 0 false CanonicalRandomVertexCut

#. benchmark.sh in-2.0-1m 6 0 true HybridCut
#. benchmark.sh in-2.0-1m 6 70 true HybridCut
#. benchmark.sh in-2.0-1m 6 1000000 true HybridCut

#. benchmark.sh soc-LiveJournal1.txt 6 0 true HybridCut
#. benchmark.sh soc-LiveJournal1.txt 6 70 true HybridCut
#. benchmark.sh soc-LiveJournal1.txt 6 4847571 true HybridCut
#. benchmark.sh soc-LiveJournal1.txt 6 0 true EdgePartition2D
#. benchmark.sh soc-LiveJournal1.txt 6 0 true EdgePartition1D
#. benchmark.sh soc-LiveJournal1.txt 6 0 true RandomVertexCut
#. benchmark.sh soc-LiveJournal1.txt 6 0 true CanonicalRandomVertexCut

#. benchmark.sh soc-LiveJournal1.txt 4 0 true HybridCut
#. benchmark.sh soc-LiveJournal1.txt 4 70 true  HybridCut
#. benchmark.sh soc-LiveJournal1.txt 4 4847571 true HybridCut
#. benchmark.sh soc-LiveJournal1.txt 4 0 true EdgePartition2D
#. benchmark.sh soc-LiveJournal1.txt 4 0 true EdgePartition1D
#. benchmark.sh soc-LiveJournal1.txt 4 0 true RandomVertexCut
#. benchmark.sh soc-LiveJournal1.txt 4 0 true CanonicalRandomVertexCut

#. benchmark.sh soc-LiveJournal1.txt 6 0 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 6 70 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 6 4847571 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 6 0 false EdgePartition2D
#. benchmark.sh soc-LiveJournal1.txt 6 0 false EdgePartition1D
#. benchmark.sh soc-LiveJournal1.txt 6 0 false RandomVertexCut
#. benchmark.sh soc-LiveJournal1.txt 6 0 false CanonicalRandomVertexCut

#. benchmark.sh soc-LiveJournal1.txt 4 0 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 4 70 false  HybridCut
#. benchmark.sh soc-LiveJournal1.txt 4 4847571 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 4 0 false EdgePartition2D
#. benchmark.sh soc-LiveJournal1.txt 4 0 false EdgePartition1D
#. benchmark.sh soc-LiveJournal1.txt 4 0 false RandomVertexCut
#. benchmark.sh soc-LiveJournal1.txt 4 0 false CanonicalRandomVertexCut

#. benchmark.sh soc-LiveJournal1.txt 16 0 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 16 100 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 16 4847571 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 16 0 false EdgePartition2D
#. benchmark.sh soc-LiveJournal1.txt 16 0 false EdgePartition1D
#. benchmark.sh soc-LiveJournal1.txt 16 0 false RandomVertexCut
#. benchmark.sh soc-LiveJournal1.txt 16 0 false CanonicalRandomVertexCut
#
#. benchmark.sh soc-LiveJournal1.txt 25 0 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 25 100 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 25 4847571 false HybridCut
#. benchmark.sh soc-LiveJournal1.txt 25 0 false EdgePartition2D
#. benchmark.sh soc-LiveJournal1.txt 25 0 false EdgePartition1D
#. benchmark.sh soc-LiveJournal1.txt 25 0 false RandomVertexCut
#. benchmark.sh soc-LiveJournal1.txt 25 0 false CanonicalRandomVertexCut

#. benchmark.sh gplus_edges 25 0 false HybridCut
#. benchmark.sh gplus_edges 25 100 false HybridCut
#. benchmark.sh gplus_edges 25 0 false EdgePartition2D
#. benchmark.sh gplus_edges 25 0 false EdgePartition1D
#. benchmark.sh gplus_edges 25 0 false RandomVertexCut
#. benchmark.sh gplus_edges 25 0 false CanonicalRandomVertexCut

#. benchmark.sh in-2.0-1m 16 0 false HybridCut
#. benchmark.sh in-2.0-1m 16 100 false HybridCut
#. benchmark.sh in-2.0-1m 16 1000000 false HybridCut
#. benchmark.sh in-2.0-1m 16 0 false EdgePartition2D
#. benchmark.sh in-2.0-1m 16 0 false EdgePartition1D
#. benchmark.sh in-2.0-1m 16 0 false RandomVertexCut
#. benchmark.sh in-2.0-1m 16 0 false CanonicalRandomVertexCut
#
#. benchmark.sh in-2.0-1m 48 0 false HybridCut
#. benchmark.sh in-2.0-1m 48 100 false HybridCut
#. benchmark.sh in-2.0-1m 48 1000000 false HybridCut
#. benchmark.sh in-2.0-1m 48 0 false EdgePartition2D
#. benchmark.sh in-2.0-1m 48 0 false EdgePartition1D
#. benchmark.sh in-2.0-1m 48 0 false RandomVertexCut
#. benchmark.sh in-2.0-1m 48 0 false CanonicalRandomVertexCut
#
#. benchmark.sh in-2.0-1m 16 0 true HybridCut
#. benchmark.sh in-2.0-1m 16 100 true HybridCut
#. benchmark.sh in-2.0-1m 16 1000000 true HybridCut
#. benchmark.sh in-2.0-1m 16 0 true EdgePartition2D
#. benchmark.sh in-2.0-1m 16 0 true EdgePartition1D
#. benchmark.sh in-2.0-1m 16 0 true RandomVertexCut
#. benchmark.sh in-2.0-1m 16 0 true CanonicalRandomVertexCut
#
#. benchmark.sh in-2.0-1m 48 0 true HybridCut
#. benchmark.sh in-2.0-1m 48 100 true HybridCut
#. benchmark.sh in-2.0-1m 48 1000000 true HybridCut
#. benchmark.sh in-2.0-1m 48 0 true EdgePartition2D
#. benchmark.sh in-2.0-1m 48 0 true EdgePartition1D
#. benchmark.sh in-2.0-1m 48 0 true RandomVertexCut
#. benchmark.sh in-2.0-1m 48 0 true CanonicalRandomVertexCut
#
# Mon Aug 11 15:56:29 CST 2014
#. benchmark.sh in-2.0-1m 16 0 false EdgePartition1DDst
#. benchmark.sh in-2.0-1m 48 0 true EdgePartition1DDst

#. benchmark.sh in-2.0-1m 9 0 false HybridCut
#. benchmark.sh in-2.0-1m 9 100 false HybridCut
#. benchmark.sh in-2.0-1m 9 1000000 false HybridCut
#. benchmark.sh in-2.0-1m 9 0 false EdgePartition2D
#. benchmark.sh in-2.0-1m 9 0 false EdgePartition1DSrc
#. benchmark.sh in-2.0-1m 9 0 false EdgePartition1DDst
#. benchmark.sh in-2.0-1m 9 0 false RandomVertexCut
#. benchmark.sh in-2.0-1m 9 0 false CanonicalRandomVertexCut

. benchmark.sh in-2.0-1m 48 36 false HybridCut
# send notification
