-- license:BSD-3-Clause
-- copyright-holders:MAMEdev Team

project "utils"
	uuid "22489ad0-4cb2-4d91-ad81-24b0d80ca30a"
	kind (LIBTYPE)

	options {
		"ForceCPP",
	}

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
	}
	if _OPTIONS["with-bundled-expat"] then
		includedirs {
			MAME_DIR .. "3rdparty/expat/lib",
		}
	end
	if _OPTIONS["with-bundled-zlib"] then
		includedirs {
			MAME_DIR .. "3rdparty/zlib",
		}
	end

	files {
		MAME_DIR .. "src/lib/util/bitstream.h",
		MAME_DIR .. "src/lib/util/coretmpl.h",
		MAME_DIR .. "src/lib/util/avhuff.c",
		MAME_DIR .. "src/lib/util/avhuff.h",
		MAME_DIR .. "src/lib/util/aviio.c",
		MAME_DIR .. "src/lib/util/aviio.h",
		MAME_DIR .. "src/lib/util/bitmap.c",
		MAME_DIR .. "src/lib/util/bitmap.h",
		MAME_DIR .. "src/lib/util/cdrom.c",
		MAME_DIR .. "src/lib/util/cdrom.h",
		MAME_DIR .. "src/lib/util/chd.c",
		MAME_DIR .. "src/lib/util/chd.h",
		MAME_DIR .. "src/lib/util/chdcd.c",
		MAME_DIR .. "src/lib/util/chdcd.h",
		MAME_DIR .. "src/lib/util/chdcodec.c",
		MAME_DIR .. "src/lib/util/chdcodec.h",
		MAME_DIR .. "src/lib/util/corealloc.c",
		MAME_DIR .. "src/lib/util/corealloc.h",
		MAME_DIR .. "src/lib/util/corefile.c",
		MAME_DIR .. "src/lib/util/corefile.h",
		MAME_DIR .. "src/lib/util/corestr.c",
		MAME_DIR .. "src/lib/util/corestr.h",
		MAME_DIR .. "src/lib/util/coreutil.c",
		MAME_DIR .. "src/lib/util/coreutil.h",
		MAME_DIR .. "src/lib/util/cstrpool.c",
		MAME_DIR .. "src/lib/util/cstrpool.h",
		MAME_DIR .. "src/lib/util/delegate.c",
		MAME_DIR .. "src/lib/util/delegate.h",
		MAME_DIR .. "src/lib/util/flac.c",
		MAME_DIR .. "src/lib/util/flac.h",
		MAME_DIR .. "src/lib/util/harddisk.c",
		MAME_DIR .. "src/lib/util/harddisk.h",
		MAME_DIR .. "src/lib/util/hashing.c",
		MAME_DIR .. "src/lib/util/hashing.h",
		MAME_DIR .. "src/lib/util/huffman.c",
		MAME_DIR .. "src/lib/util/huffman.h",
		MAME_DIR .. "src/lib/util/jedparse.c",
		MAME_DIR .. "src/lib/util/jedparse.h",
		MAME_DIR .. "src/lib/util/md5.c",
		MAME_DIR .. "src/lib/util/md5.h",
		MAME_DIR .. "src/lib/util/opresolv.c",
		MAME_DIR .. "src/lib/util/opresolv.h",
		MAME_DIR .. "src/lib/util/options.c",
		MAME_DIR .. "src/lib/util/options.h",
		MAME_DIR .. "src/lib/util/palette.c",
		MAME_DIR .. "src/lib/util/palette.h",
		MAME_DIR .. "src/lib/util/plaparse.c",
		MAME_DIR .. "src/lib/util/plaparse.h",
		MAME_DIR .. "src/lib/util/png.c",
		MAME_DIR .. "src/lib/util/png.h",
		MAME_DIR .. "src/lib/util/pool.c",
		MAME_DIR .. "src/lib/util/pool.h",
		MAME_DIR .. "src/lib/util/sha1.c",
		MAME_DIR .. "src/lib/util/sha1.h",
		MAME_DIR .. "src/lib/util/tagmap.c",
		MAME_DIR .. "src/lib/util/tagmap.h",
		MAME_DIR .. "src/lib/util/unicode.c",
		MAME_DIR .. "src/lib/util/unicode.h",
		MAME_DIR .. "src/lib/util/unzip.c",
		MAME_DIR .. "src/lib/util/unzip.h",
		MAME_DIR .. "src/lib/util/un7z.c",
		MAME_DIR .. "src/lib/util/un7z.h",
		MAME_DIR .. "src/lib/util/vbiparse.c",
		MAME_DIR .. "src/lib/util/vbiparse.h",
		MAME_DIR .. "src/lib/util/xmlfile.c",
		MAME_DIR .. "src/lib/util/xmlfile.h",
		MAME_DIR .. "src/lib/util/zippath.c",
		MAME_DIR .. "src/lib/util/zippath.h",
	}


project "formats"
	uuid "f69636b1-fcce-45ce-b09a-113e371a2d7a"
	kind (LIBTYPE)

	options {
		"ForceCPP",
		"ArchiveSplit",
	}

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
	}

	if _OPTIONS["with-bundled-zlib"] then
		includedirs {
			MAME_DIR .. "3rdparty/zlib",
		}
	end

	files {
		MAME_DIR .. "src/lib/formats/2d_dsk.c",
		MAME_DIR .. "src/lib/formats/2d_dsk.h",
		MAME_DIR .. "src/lib/formats/cassimg.c",
		MAME_DIR .. "src/lib/formats/cassimg.h",
		MAME_DIR .. "src/lib/formats/flopimg.c",
		MAME_DIR .. "src/lib/formats/flopimg.h",
		MAME_DIR .. "src/lib/formats/imageutl.c",
		MAME_DIR .. "src/lib/formats/imageutl.h",
		MAME_DIR .. "src/lib/formats/ioprocs.c",
		MAME_DIR .. "src/lib/formats/ioprocs.h",
		MAME_DIR .. "src/lib/formats/basicdsk.c",
		MAME_DIR .. "src/lib/formats/basicdsk.h",
		MAME_DIR .. "src/lib/formats/a26_cas.c",
		MAME_DIR .. "src/lib/formats/a26_cas.h",
		MAME_DIR .. "src/lib/formats/a5105_dsk.c",
		MAME_DIR .. "src/lib/formats/a5105_dsk.h",
		MAME_DIR .. "src/lib/formats/abc800_dsk.c",
		MAME_DIR .. "src/lib/formats/abc800_dsk.h",
		MAME_DIR .. "src/lib/formats/abcfd2_dsk.c",
		MAME_DIR .. "src/lib/formats/abcfd2_dsk.h",
		MAME_DIR .. "src/lib/formats/ace_tap.c",
		MAME_DIR .. "src/lib/formats/ace_tap.h",
		MAME_DIR .. "src/lib/formats/adam_cas.c",
		MAME_DIR .. "src/lib/formats/adam_cas.h",
		MAME_DIR .. "src/lib/formats/adam_dsk.c",
		MAME_DIR .. "src/lib/formats/adam_dsk.h",
		MAME_DIR .. "src/lib/formats/ami_dsk.c",
		MAME_DIR .. "src/lib/formats/ami_dsk.h",
		MAME_DIR .. "src/lib/formats/ap2_dsk.c",
		MAME_DIR .. "src/lib/formats/ap2_dsk.h",
		MAME_DIR .. "src/lib/formats/apf_apt.c",
		MAME_DIR .. "src/lib/formats/apf_apt.h",
		MAME_DIR .. "src/lib/formats/apridisk.c",
		MAME_DIR .. "src/lib/formats/apridisk.h",
		MAME_DIR .. "src/lib/formats/apollo_dsk.c",
		MAME_DIR .. "src/lib/formats/apollo_dsk.h",
		MAME_DIR .. "src/lib/formats/ap_dsk35.c",
		MAME_DIR .. "src/lib/formats/ap_dsk35.h",
		MAME_DIR .. "src/lib/formats/applix_dsk.c",
		MAME_DIR .. "src/lib/formats/applix_dsk.h",
		MAME_DIR .. "src/lib/formats/asst128_dsk.c",
		MAME_DIR .. "src/lib/formats/asst128_dsk.h",
		MAME_DIR .. "src/lib/formats/atari_dsk.c",
		MAME_DIR .. "src/lib/formats/atari_dsk.h",
		MAME_DIR .. "src/lib/formats/atom_tap.c",
		MAME_DIR .. "src/lib/formats/atom_tap.h",
		MAME_DIR .. "src/lib/formats/bbc_dsk.c",
		MAME_DIR .. "src/lib/formats/bbc_dsk.h",
		MAME_DIR .. "src/lib/formats/bw2_dsk.c",
		MAME_DIR .. "src/lib/formats/bw2_dsk.h",
		MAME_DIR .. "src/lib/formats/bw12_dsk.c",
		MAME_DIR .. "src/lib/formats/bw12_dsk.h",
		MAME_DIR .. "src/lib/formats/c3040_dsk.c",
		MAME_DIR .. "src/lib/formats/c3040_dsk.h",
		MAME_DIR .. "src/lib/formats/c4040_dsk.c",
		MAME_DIR .. "src/lib/formats/c4040_dsk.h",
		MAME_DIR .. "src/lib/formats/c8280_dsk.c",
		MAME_DIR .. "src/lib/formats/c8280_dsk.h",
		MAME_DIR .. "src/lib/formats/camplynx_cas.c",
		MAME_DIR .. "src/lib/formats/camplynx_cas.h",
		MAME_DIR .. "src/lib/formats/cbm_crt.c",
		MAME_DIR .. "src/lib/formats/cbm_crt.h",
		MAME_DIR .. "src/lib/formats/cbm_tap.c",
		MAME_DIR .. "src/lib/formats/cbm_tap.h",
		MAME_DIR .. "src/lib/formats/ccvf_dsk.c",
		MAME_DIR .. "src/lib/formats/ccvf_dsk.h",
		MAME_DIR .. "src/lib/formats/cd90_640_dsk.c",
		MAME_DIR .. "src/lib/formats/cd90_640_dsk.h",
		MAME_DIR .. "src/lib/formats/cgen_cas.c",
		MAME_DIR .. "src/lib/formats/cgen_cas.h",
		MAME_DIR .. "src/lib/formats/cgenie_dsk.c",
		MAME_DIR .. "src/lib/formats/cgenie_dsk.h",
		MAME_DIR .. "src/lib/formats/coco_cas.c",
		MAME_DIR .. "src/lib/formats/coco_cas.h",
		MAME_DIR .. "src/lib/formats/comx35_dsk.c",
		MAME_DIR .. "src/lib/formats/comx35_dsk.h",
		MAME_DIR .. "src/lib/formats/concept_dsk.c",
		MAME_DIR .. "src/lib/formats/concept_dsk.h",
		MAME_DIR .. "src/lib/formats/coupedsk.c",
		MAME_DIR .. "src/lib/formats/coupedsk.h",
		MAME_DIR .. "src/lib/formats/cpis_dsk.c",
		MAME_DIR .. "src/lib/formats/cpis_dsk.h",
		MAME_DIR .. "src/lib/formats/cqm_dsk.c",
		MAME_DIR .. "src/lib/formats/cqm_dsk.h",
		MAME_DIR .. "src/lib/formats/csw_cas.c",
		MAME_DIR .. "src/lib/formats/csw_cas.h",
		MAME_DIR .. "src/lib/formats/d64_dsk.c",
		MAME_DIR .. "src/lib/formats/d64_dsk.h",
		MAME_DIR .. "src/lib/formats/d71_dsk.c",
		MAME_DIR .. "src/lib/formats/d71_dsk.h",
		MAME_DIR .. "src/lib/formats/d80_dsk.c",
		MAME_DIR .. "src/lib/formats/d80_dsk.h",
		MAME_DIR .. "src/lib/formats/d81_dsk.c",
		MAME_DIR .. "src/lib/formats/d81_dsk.h",
		MAME_DIR .. "src/lib/formats/d82_dsk.c",
		MAME_DIR .. "src/lib/formats/d82_dsk.h",
		MAME_DIR .. "src/lib/formats/d88_dsk.c",
		MAME_DIR .. "src/lib/formats/d88_dsk.h",
		MAME_DIR .. "src/lib/formats/dcp_dsk.c",
		MAME_DIR .. "src/lib/formats/dcp_dsk.h",
		MAME_DIR .. "src/lib/formats/dfi_dsk.c",
		MAME_DIR .. "src/lib/formats/dfi_dsk.h",
		MAME_DIR .. "src/lib/formats/dim_dsk.c",
		MAME_DIR .. "src/lib/formats/dim_dsk.h",
		MAME_DIR .. "src/lib/formats/dip_dsk.c",
		MAME_DIR .. "src/lib/formats/dip_dsk.h",
		MAME_DIR .. "src/lib/formats/dmk_dsk.c",
		MAME_DIR .. "src/lib/formats/dmk_dsk.h",
		MAME_DIR .. "src/lib/formats/dmv_dsk.c",
		MAME_DIR .. "src/lib/formats/dmv_dsk.h",
		MAME_DIR .. "src/lib/formats/dsk_dsk.c",
		MAME_DIR .. "src/lib/formats/dsk_dsk.h",
		MAME_DIR .. "src/lib/formats/ep64_dsk.c",
		MAME_DIR .. "src/lib/formats/ep64_dsk.h",
		MAME_DIR .. "src/lib/formats/esq8_dsk.c",
		MAME_DIR .. "src/lib/formats/esq8_dsk.h",
		MAME_DIR .. "src/lib/formats/esq16_dsk.c",
		MAME_DIR .. "src/lib/formats/esq16_dsk.h",
		MAME_DIR .. "src/lib/formats/excali64_dsk.c",
		MAME_DIR .. "src/lib/formats/excali64_dsk.h",
		MAME_DIR .. "src/lib/formats/fc100_cas.c",
		MAME_DIR .. "src/lib/formats/fc100_cas.h",
		MAME_DIR .. "src/lib/formats/fdi_dsk.c",
		MAME_DIR .. "src/lib/formats/fdd_dsk.c",
		MAME_DIR .. "src/lib/formats/fdd_dsk.h",
		MAME_DIR .. "src/lib/formats/flex_dsk.c",
		MAME_DIR .. "src/lib/formats/flex_dsk.h",
		MAME_DIR .. "src/lib/formats/fm7_cas.c",
		MAME_DIR .. "src/lib/formats/fm7_cas.h",
		MAME_DIR .. "src/lib/formats/fmsx_cas.c",
		MAME_DIR .. "src/lib/formats/fmsx_cas.h",
		MAME_DIR .. "src/lib/formats/fmtowns_dsk.c",
		MAME_DIR .. "src/lib/formats/fmtowns_dsk.h",
		MAME_DIR .. "src/lib/formats/g64_dsk.c",
		MAME_DIR .. "src/lib/formats/g64_dsk.h",
		MAME_DIR .. "src/lib/formats/gtp_cas.c",
		MAME_DIR .. "src/lib/formats/gtp_cas.h",
		MAME_DIR .. "src/lib/formats/guab_dsk.c",
		MAME_DIR .. "src/lib/formats/guab_dsk.h",
		MAME_DIR .. "src/lib/formats/hect_dsk.c",
		MAME_DIR .. "src/lib/formats/hect_dsk.h",
		MAME_DIR .. "src/lib/formats/hect_tap.c",
		MAME_DIR .. "src/lib/formats/hect_tap.h",
		MAME_DIR .. "src/lib/formats/hector_minidisc.c",
		MAME_DIR .. "src/lib/formats/hector_minidisc.h",
		MAME_DIR .. "src/lib/formats/iq151_dsk.c",
		MAME_DIR .. "src/lib/formats/iq151_dsk.h",
		MAME_DIR .. "src/lib/formats/imd_dsk.c",
		MAME_DIR .. "src/lib/formats/imd_dsk.h",
		MAME_DIR .. "src/lib/formats/ipf_dsk.c",
		MAME_DIR .. "src/lib/formats/ipf_dsk.h",
		MAME_DIR .. "src/lib/formats/jvc_dsk.c",
		MAME_DIR .. "src/lib/formats/jvc_dsk.h",
		MAME_DIR .. "src/lib/formats/kaypro_dsk.c",
		MAME_DIR .. "src/lib/formats/kaypro_dsk.h",
		MAME_DIR .. "src/lib/formats/kc_cas.c",
		MAME_DIR .. "src/lib/formats/kc_cas.h",
		MAME_DIR .. "src/lib/formats/kc85_dsk.c",
		MAME_DIR .. "src/lib/formats/kc85_dsk.h",
		MAME_DIR .. "src/lib/formats/kim1_cas.c",
		MAME_DIR .. "src/lib/formats/kim1_cas.h",
		MAME_DIR .. "src/lib/formats/lviv_lvt.c",
		MAME_DIR .. "src/lib/formats/lviv_lvt.h",
		MAME_DIR .. "src/lib/formats/m20_dsk.c",
		MAME_DIR .. "src/lib/formats/m20_dsk.h",
		MAME_DIR .. "src/lib/formats/m5_dsk.c",
		MAME_DIR .. "src/lib/formats/m5_dsk.h",
		MAME_DIR .. "src/lib/formats/mbee_cas.c",
		MAME_DIR .. "src/lib/formats/mbee_cas.h",
		MAME_DIR .. "src/lib/formats/mm_dsk.c",
		MAME_DIR .. "src/lib/formats/mm_dsk.h",
		MAME_DIR .. "src/lib/formats/msx_dsk.c",
		MAME_DIR .. "src/lib/formats/msx_dsk.h",
		MAME_DIR .. "src/lib/formats/mfi_dsk.c",
		MAME_DIR .. "src/lib/formats/mfi_dsk.h",
		MAME_DIR .. "src/lib/formats/mfm_hd.c",
		MAME_DIR .. "src/lib/formats/mfm_hd.h",
		MAME_DIR .. "src/lib/formats/mz_cas.c",
		MAME_DIR .. "src/lib/formats/mz_cas.h",
		MAME_DIR .. "src/lib/formats/nanos_dsk.c",
		MAME_DIR .. "src/lib/formats/nanos_dsk.h",
		MAME_DIR .. "src/lib/formats/nascom_dsk.c",
		MAME_DIR .. "src/lib/formats/nascom_dsk.h",
		MAME_DIR .. "src/lib/formats/naslite_dsk.c",
		MAME_DIR .. "src/lib/formats/naslite_dsk.h",
		MAME_DIR .. "src/lib/formats/nes_dsk.c",
		MAME_DIR .. "src/lib/formats/nes_dsk.h",
		MAME_DIR .. "src/lib/formats/nfd_dsk.c",
		MAME_DIR .. "src/lib/formats/nfd_dsk.h",
		MAME_DIR .. "src/lib/formats/orao_cas.c",
		MAME_DIR .. "src/lib/formats/orao_cas.h",
		MAME_DIR .. "src/lib/formats/oric_dsk.c",
		MAME_DIR .. "src/lib/formats/oric_dsk.h",
		MAME_DIR .. "src/lib/formats/oric_tap.c",
		MAME_DIR .. "src/lib/formats/oric_tap.h",
		MAME_DIR .. "src/lib/formats/p6001_cas.c",
		MAME_DIR .. "src/lib/formats/p6001_cas.h",
		MAME_DIR .. "src/lib/formats/pasti_dsk.c",
		MAME_DIR .. "src/lib/formats/pasti_dsk.h",
		MAME_DIR .. "src/lib/formats/pc_dsk.c",
		MAME_DIR .. "src/lib/formats/pc_dsk.h",
		MAME_DIR .. "src/lib/formats/pc98_dsk.c",
		MAME_DIR .. "src/lib/formats/pc98_dsk.h",
		MAME_DIR .. "src/lib/formats/pc98fdi_dsk.c",
		MAME_DIR .. "src/lib/formats/pc98fdi_dsk.h",
		MAME_DIR .. "src/lib/formats/phc25_cas.c",
		MAME_DIR .. "src/lib/formats/phc25_cas.h",
		MAME_DIR .. "src/lib/formats/pk8020_dsk.c",
		MAME_DIR .. "src/lib/formats/pk8020_dsk.h",
		MAME_DIR .. "src/lib/formats/pmd_cas.c",
		MAME_DIR .. "src/lib/formats/pmd_cas.h",
		MAME_DIR .. "src/lib/formats/primoptp.c",
		MAME_DIR .. "src/lib/formats/primoptp.h",
		MAME_DIR .. "src/lib/formats/pyldin_dsk.c",
		MAME_DIR .. "src/lib/formats/pyldin_dsk.h",
		MAME_DIR .. "src/lib/formats/ql_dsk.c",
		MAME_DIR .. "src/lib/formats/ql_dsk.h",
		MAME_DIR .. "src/lib/formats/rk_cas.c",
		MAME_DIR .. "src/lib/formats/rk_cas.h",
		MAME_DIR .. "src/lib/formats/rx50_dsk.c",
		MAME_DIR .. "src/lib/formats/rx50_dsk.h",
		MAME_DIR .. "src/lib/formats/sc3000_bit.c",
		MAME_DIR .. "src/lib/formats/sc3000_bit.h",
		MAME_DIR .. "src/lib/formats/sf7000_dsk.c",
		MAME_DIR .. "src/lib/formats/sf7000_dsk.h",
		MAME_DIR .. "src/lib/formats/smx_dsk.c",
		MAME_DIR .. "src/lib/formats/smx_dsk.h",
		MAME_DIR .. "src/lib/formats/sol_cas.c",
		MAME_DIR .. "src/lib/formats/sol_cas.h",
		MAME_DIR .. "src/lib/formats/sorc_dsk.c",
		MAME_DIR .. "src/lib/formats/sorc_dsk.h",
		MAME_DIR .. "src/lib/formats/sorc_cas.c",
		MAME_DIR .. "src/lib/formats/sorc_cas.h",
		MAME_DIR .. "src/lib/formats/sord_cas.c",
		MAME_DIR .. "src/lib/formats/sord_cas.h",
		MAME_DIR .. "src/lib/formats/spc1000_cas.c",
		MAME_DIR .. "src/lib/formats/spc1000_cas.h",
		MAME_DIR .. "src/lib/formats/st_dsk.c",
		MAME_DIR .. "src/lib/formats/st_dsk.h",
		MAME_DIR .. "src/lib/formats/svi_cas.c",
		MAME_DIR .. "src/lib/formats/svi_cas.h",
		MAME_DIR .. "src/lib/formats/svi_dsk.c",
		MAME_DIR .. "src/lib/formats/svi_dsk.h",
		MAME_DIR .. "src/lib/formats/tandy2k_dsk.c",
		MAME_DIR .. "src/lib/formats/tandy2k_dsk.h",
		MAME_DIR .. "src/lib/formats/td0_dsk.c",
		MAME_DIR .. "src/lib/formats/td0_dsk.h",
		MAME_DIR .. "src/lib/formats/thom_cas.c",
		MAME_DIR .. "src/lib/formats/thom_cas.h",
		MAME_DIR .. "src/lib/formats/thom_dsk.c",
		MAME_DIR .. "src/lib/formats/thom_dsk.h",
		MAME_DIR .. "src/lib/formats/ti99_dsk.c",
		MAME_DIR .. "src/lib/formats/ti99_dsk.h",
		MAME_DIR .. "src/lib/formats/tiki100_dsk.c",
		MAME_DIR .. "src/lib/formats/tiki100_dsk.h",
		MAME_DIR .. "src/lib/formats/trd_dsk.c",
		MAME_DIR .. "src/lib/formats/trd_dsk.h",
		MAME_DIR .. "src/lib/formats/trs_cas.c",
		MAME_DIR .. "src/lib/formats/trs_cas.h",
		MAME_DIR .. "src/lib/formats/trs80_dsk.c",
		MAME_DIR .. "src/lib/formats/trs80_dsk.h",
		MAME_DIR .. "src/lib/formats/tvc_cas.c",
		MAME_DIR .. "src/lib/formats/tvc_cas.h",
		MAME_DIR .. "src/lib/formats/tvc_dsk.c",
		MAME_DIR .. "src/lib/formats/tvc_dsk.h",
		MAME_DIR .. "src/lib/formats/tzx_cas.c",
		MAME_DIR .. "src/lib/formats/tzx_cas.h",
		MAME_DIR .. "src/lib/formats/uef_cas.c",
		MAME_DIR .. "src/lib/formats/uef_cas.h",
		MAME_DIR .. "src/lib/formats/upd765_dsk.c",
		MAME_DIR .. "src/lib/formats/upd765_dsk.h",
		MAME_DIR .. "src/lib/formats/vdk_dsk.c",
		MAME_DIR .. "src/lib/formats/vdk_dsk.h",
		MAME_DIR .. "src/lib/formats/vector06_dsk.c",
		MAME_DIR .. "src/lib/formats/vector06_dsk.h",
		MAME_DIR .. "src/lib/formats/victor9k_dsk.c",
		MAME_DIR .. "src/lib/formats/victor9k_dsk.h",
		MAME_DIR .. "src/lib/formats/vg5k_cas.c",
		MAME_DIR .. "src/lib/formats/vg5k_cas.h",
		MAME_DIR .. "src/lib/formats/vt_cas.c",
		MAME_DIR .. "src/lib/formats/vt_cas.h",
		MAME_DIR .. "src/lib/formats/wavfile.c",
		MAME_DIR .. "src/lib/formats/wavfile.h",
		MAME_DIR .. "src/lib/formats/wd177x_dsk.c",
		MAME_DIR .. "src/lib/formats/wd177x_dsk.h",
		MAME_DIR .. "src/lib/formats/x07_cas.c",
		MAME_DIR .. "src/lib/formats/x07_cas.h",
		MAME_DIR .. "src/lib/formats/x1_tap.c",
		MAME_DIR .. "src/lib/formats/x1_tap.h",
		MAME_DIR .. "src/lib/formats/xdf_dsk.c",
		MAME_DIR .. "src/lib/formats/xdf_dsk.h",
		MAME_DIR .. "src/lib/formats/zx81_p.c",
		MAME_DIR .. "src/lib/formats/zx81_p.h",
		MAME_DIR .. "src/lib/formats/hxcmfm_dsk.c",
		MAME_DIR .. "src/lib/formats/hxcmfm_dsk.h",
		MAME_DIR .. "src/lib/formats/itt3030_dsk.c",
		MAME_DIR .. "src/lib/formats/itt3030_dsk.h",
	}

