// license:BSD-3-Clause
// copyright-holders:Curt Coder
/*********************************************************************

    formats/tandy2k_dsk.h

    Tandy 2000 disk format

*********************************************************************/

#ifndef BW2_DSK_H_
#define BW2_DSK_H_

#include "upd765_dsk.h"

class tandy2k_format : public upd765_format {
public:
	tandy2k_format();

	virtual const char *name() const override;
	virtual const char *description() const override;
	virtual const char *extensions() const override;

private:
	static const format formats[];
};

extern const floppy_format_type FLOPPY_TANDY_2000_FORMAT;

#endif
