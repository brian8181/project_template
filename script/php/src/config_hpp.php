<?php
	/*
    *  @brief create skeleton
	*  @file config_hpp.php
	*  @date Sat, Sep 20, 2025  9:24:24 PM
	*  @version 0.0.1
	*/
    $NAME=$argv[1];
    $DATE=$argv[2];
	$VERSION="version 0.0.1";
	include "cstyle_file_header.php"
    ?>
/**
 * @brief settings for the scanner project.
 * @file config.hpp
 */

// -*- mode:c++;tab-width:2;indent-tabs-mode:t;show-trailing-whitespace:t;rm-trailing-spaces:t -*-
// vi: set ts=2 noet:
// * This file is part of the Inflex project.
// * It is subject to the license terms in the LICENSE file found in the top-level directory of this distribution.
// * No part of the Inflex project, including this file, may be copied, modified, or distributed except according to those terms.
// *

#pragma once
#ifndef CYGWIN
#define CYGWIN true
#endif
