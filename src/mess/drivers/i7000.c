// license:GPL-2.0+
// copyright-holders: Felipe Sanches
/***************************************************************************

    Itautec I7000

    driver by Felipe C. da S. Sanches <juca@members.fsf.org>
    with tech info provided by Alexandre Souza (a.k.a. Tabajara).

    The portuguese Wikipedia article available at
    http://pt.wikipedia.org/wiki/Itautec_I-7000
    also provides a technical overview of this machine:

    The I-7000 was the first computer manufactured by Itautec
    (http://www.itautec.com.br/pt-br/produtos). It was originally an 8 bit CP/M
    computer that became an IBM PC-XT clone in later hardware revisions which
    took the "I-7000 PC-XT" name.

    * Released in 1982
    * Operating System: SIM/M / BASIC
    * CPU: National NSC800 D-4 at 4,00 MHz
    * Memory: 64KB to 128KB
    * keyboards: 80 keys (with a reduced numerical keypad and function keys)
    * display:
     - 40 X 25 text
     - 80 X 25 text
     - 160 X 100 (8 colors)
     - 640 X 200 (monochrome, with an expansion board)
     - 320 X 200 (16 colors, with an expansion board)
    * Expansion slots:
     - 1 frontal cart slot
     - 4 internal expansion slots
    * Ports:
     - 1 composite video output for a color monitor
     - 2 cassete interfaces
     - 1 RS-232C serial port
     - 1 parallel interface
    * Storage:
     - Cassetes recorder
     - Up to 4 external floppy drives: 8" (FD/DD, 1,1MB) or 5" 1/4
     - Up to 1 external 10 MB hard-drive

****************************************************************************/

#include "emu.h"
#include "cpu/z80/z80.h" //CPU was actually a NSC800 (Z80 compatible)
#include "bus/generic/carts.h"

class i7000_state : public driver_device
{
public:
	i7000_state(const machine_config &mconfig, device_type type, const char *tag)
		: driver_device(mconfig, type, tag),
          m_maincpu(*this, "maincpu"),
          m_card(*this, "cardslot"),
          m_videoram(*this, "videoram")
    { }

	void video_start();
	void machine_start();

	required_device<cpu_device> m_maincpu;
	required_device<generic_slot_device> m_card;
	required_shared_ptr<UINT8> m_videoram;
	UINT32 screen_update(screen_device &screen, bitmap_ind16 &bitmap, const rectangle &cliprect);
	UINT8 *m_char_rom;

	DECLARE_DRIVER_INIT(i7000);
	DECLARE_PALETTE_INIT(i7000);
	DECLARE_DEVICE_IMAGE_LOAD_MEMBER( i7000_card );

	DECLARE_READ8_MEMBER( i7000_io_keyboard_r );
};

READ8_MEMBER( i7000_state::i7000_io_keyboard_r )
{
	static UINT8 keyvalue = 0;
	UINT8 data = 0;
	UINT8 key_values1[] = {0xC9, 0xC0, 0xC8, 0xD0, 0xD8, 0xe0, 0xe8, 0xF0};
	UINT8 key_values2[] = {0xF8, 0xC1, 0xF3, 0xFD, 0xD5, 0xDB};

	if (offset==1){
        keyvalue = 0;
        data = ioport("KEYS1")->read();
        for (int i=0; i<8; i++){
            if (data & 1) {
                keyvalue = key_values1[i];
                return 1;
            }
            data >>= 1;
        }

        data = ioport("KEYS2")->read();
        for (int i=0; i<6; i++){
            if (data & 1) {
                keyvalue = key_values2[i];
                return 1;
            }
            data >>= 1;
        }
        return 0;
    }
    //else if (offset==0)
    return keyvalue;
}

/* Input ports */
static INPUT_PORTS_START( i7000 )
	PORT_START("KEYS1")
		PORT_BIT( 0x01, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_0) PORT_CHAR('0')//0xC9
		PORT_BIT( 0x02, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_1) PORT_CHAR('1')//0xC0
		PORT_BIT( 0x04, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_2) PORT_CHAR('2')//0xC8
		PORT_BIT( 0x08, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_3) PORT_CHAR('3')//0xD0
		PORT_BIT( 0x10, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_4) PORT_CHAR('4')//0xD8
		PORT_BIT( 0x20, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_5) PORT_CHAR('5')//0xE0
		PORT_BIT( 0x40, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_6) PORT_CHAR('6')//0xE8
		PORT_BIT( 0x80, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_7) PORT_CHAR('7')//0xF0

	PORT_START("KEYS2")
		PORT_BIT( 0x01, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_8) PORT_CHAR('8')//0xF8
		PORT_BIT( 0x02, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_9) PORT_CHAR('9')//0xC1
		PORT_BIT( 0x04, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_A) PORT_CHAR('A')//0xF3
		PORT_BIT( 0x08, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_B) PORT_CHAR('B')//0xFD
		PORT_BIT( 0x10, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_C) PORT_CHAR('C')//0xD5
		PORT_BIT( 0x20, IP_ACTIVE_HIGH, IPT_KEYBOARD ) PORT_CODE(KEYCODE_D) PORT_CHAR('D')//0xDB
		PORT_BIT( 0x40, IP_ACTIVE_HIGH, IPT_UNUSED )
		PORT_BIT( 0x80, IP_ACTIVE_HIGH, IPT_UNUSED )
INPUT_PORTS_END

DRIVER_INIT_MEMBER(i7000_state, i7000)
{
}

void i7000_state::machine_start()
{
	address_space &program = m_maincpu->space(AS_PROGRAM);

	if (m_card->exists())
	{
		// 0x4000 - 0xbfff   32KB ROM
		program.install_read_handler(0x4000, 0xbfff, read8_delegate(FUNC(generic_slot_device::read_rom),(generic_slot_device*)m_card));
	}
}

PALETTE_INIT_MEMBER(i7000_state, i7000)
{
	palette.set_pen_color(0, rgb_t(0x33, 0x33, 0x33));
	palette.set_pen_color(1, rgb_t(0xBB, 0xBB, 0xBB));
}

void i7000_state::video_start()
{
	// find memory regions
	m_char_rom = memregion("gfx1")->base();
}

UINT32 i7000_state::screen_update(screen_device &screen, bitmap_ind16 &bitmap, const rectangle &cliprect)
{
    offs_t addr = 0;

    for (int sy = 0; sy < 25; sy++)
    {
        for (int sx = 0; sx < 40; sx++)
        {
            UINT8 data = m_videoram[addr++];
            for (int y = 0; y < 8; y++)
            {
                int color = m_char_rom[data*8 + y];
                for (int x = 0; x < 8; x++)
                {
                    bitmap.pix16(sy*8 + y, sx*8 + 7 - x) = (color & 1);
                    color >>= 1;
                }
            }
        }
    }

    return 0;
}

/*FIXME: we still need to figure out the proper memory map
         for the maincpu and where the cartridge slot maps to. */
static ADDRESS_MAP_START(i7000_mem, AS_PROGRAM, 8, i7000_state)
    AM_RANGE(0x0000, 0x0fff) AM_ROM AM_REGION("maincpu", 0)
    AM_RANGE(0x1000, 0x1fff) AM_RAM
    AM_RANGE(0x2000, 0x3fff) AM_RAM AM_SHARE("videoram")
//    AM_RANGE(0x4000, 0xbfff) AM_ROM AM_REGION("cardslot", 0)
ADDRESS_MAP_END

static ADDRESS_MAP_START( i7000_io , AS_IO, 8, i7000_state)
	ADDRESS_MAP_UNMAP_HIGH
	ADDRESS_MAP_GLOBAL_MASK (0xff)
//	AM_RANGE(0x06, 0x06) AM_READWRITE(i7000_io_?_r, i7000_io_?_w)
//	AM_RANGE(0x08, 0x09) AM_READWRITE(i7000_io_?_r, i7000_io_?_w) //printer perhaps?
//	AM_RANGE(0x0c, 0x0c) AM_READWRITE(i7000_io_?_r, i7000_io_?_w) //0x0C and 0x10 may be related to mem page swapping. (self-test "4. PAG")
//	AM_RANGE(0x10, 0x10) AM_READWRITE(i7000_io_?_r, i7000_io_?_w)
//	AM_RANGE(0x14, 0x15) AM_READWRITE(i7000_io_?_r, i7000_io_?_w)
//	AM_RANGE(0x1a, 0x1b) AM_READWRITE(i7000_io_buzzer_r, i7000_io_buzzer_w)
//	AM_RANGE(0x1c, 0x1c) AM_WRITE(i7000_io_printer_data_w) //ASCII data
//	AM_RANGE(0x1e, 0x1e) AM_READ(i7000_io_printer_status_r)
//	AM_RANGE(0x1f, 0x1f) AM_WRITE(i7000_io_printer_strobe_w) //self-test routine writes 0x08 and 0x09 (it seems that bit 0 is the strobe and bit 3 is an enable signal)
//	AM_RANGE(0x20, 0x21) AM_READ(i7000_io_keyboard_r)
//	AM_RANGE(0x25, 0x25) AM_READWRITE(i7000_io_?_r, i7000_io_?_w)
//	AM_RANGE(0x28, 0x2d) AM_READWRITE(i7000_io_joystick_r, i7000_io_joystick_w)
//	AM_RANGE(0x3b, 0x3b) AM_READWRITE(i7000_io_?_r, i7000_io_?_w)
//	AM_RANGE(0x66, 0x67) AM_READWRITE(i7000_io_?_r, i7000_io_?_w)
ADDRESS_MAP_END

DEVICE_IMAGE_LOAD_MEMBER( i7000_state, i7000_card )
{
	UINT32 size = m_card->common_get_size("rom");

	m_card->rom_alloc(size, GENERIC_ROM8_WIDTH, ENDIANNESS_BIG);
	m_card->common_load_rom(m_card->get_rom_base(), size, "rom");

	return IMAGE_INIT_PASS;
}

#if 0
static const gfx_layout i7000_charlayout =
{
	8, 8,                   /* 8 x 8 characters */
	256,                 /* 256 characters */
	1,                  /* 1 bits per pixel */
	{ 0 },                  /* no bitplanes */
	/* x offsets */
	{ 0, 1, 2, 3, 4, 5, 6, 7 },
	/* y offsets */
	{ 0*8, 1*8, 2*8, 3*8, 4*8, 5*8, 6*8, 7*8 },
	8*8                 /* every char takes 8 bytes */
};

static GFXDECODE_START( i7000 )
	GFXDECODE_ENTRY( "gfx1", 0x0000, i7000_charlayout, 0, 8 )
GFXDECODE_END
#endif

static MACHINE_CONFIG_START( i7000, i7000_state )

	/* basic machine hardware */
	MCFG_CPU_ADD("maincpu", NSC800, XTAL_4MHz)
	MCFG_CPU_PROGRAM_MAP(i7000_mem)
	MCFG_CPU_IO_MAP(i7000_io)

	/* video hardware */
	MCFG_SCREEN_ADD("screen", RASTER)
	MCFG_SCREEN_REFRESH_RATE(60)
	MCFG_SCREEN_SIZE(320, 200) /* 40x25 8x8 chars */
	MCFG_SCREEN_VISIBLE_AREA(0, 320-1, 0, 200-1)

	MCFG_SCREEN_UPDATE_DRIVER(i7000_state, screen_update)
	MCFG_SCREEN_PALETTE("palette")

	MCFG_PALETTE_ADD("palette", 2)
	MCFG_PALETTE_INIT_OWNER(i7000_state, i7000)

//	MCFG_GFXDECODE_ADD("gfxdecode", "palette", i7000)

	/* Cartridge slot */
	MCFG_GENERIC_CARTSLOT_ADD("cardslot", generic_romram_plain_slot, "i7000_card")
	MCFG_GENERIC_EXTENSIONS("rom")
	MCFG_GENERIC_LOAD(i7000_state, i7000_card)

	/* Software lists */
	MCFG_SOFTWARE_LIST_ADD("card_list", "i7000_card")
MACHINE_CONFIG_END

ROM_START( i7000 )
	ROM_REGION( 0x1000, "maincpu", 0 )
	ROM_LOAD( "i7000_boot_v1_4r02_15_10_85_d52d.rom",  0x0000, 0x1000, CRC(622412e5) SHA1(bf187a095600fd46a739c35132a85b5f39b2f867) )

	ROM_REGION( 0x0800, "gfx1", 0 )
	ROM_LOAD( "i7000_chargen.rom", 0x0000, 0x0800, CRC(7ba75183) SHA1(4af799f4a8bd385e1e4e5ece378df93e1133dc12) )

	ROM_REGION( 0x1000, "drive", 0 )
	ROM_LOAD( "i7000_drive_ci01.rom", 0x0000, 0x1000, CRC(d8d6e5c1) SHA1(93e7db42fbfaa8243973321c7fc8c51ed80780be) )

	ROM_REGION( 0x1000, "telex", 0 )
	ROM_LOAD( "i7000_telex_ci09.rom", 0x0000, 0x1000, CRC(c1c8fcc8) SHA1(cbf5fb600e587b998f190a9e3fb398a51d8a5e87) )
ROM_END

/*    YEAR  NAME    PARENT  COMPAT   MACHINE    INPUT    INIT                COMPANY    FULLNAME    FLAGS */
COMP( 1982, i7000,  0,      0,       i7000,     i7000,   i7000_state, i7000, "Itautec", "I-7000",   GAME_NOT_WORKING | GAME_NO_SOUND)
