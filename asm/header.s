.section .header, "a"

.word 0x80371240       /* PI BSB Domain 1 register */
.word 0x0000000F       /* Clockrate setting */
.word 0x80000400       /* Entrypoint address */
.word 0x00001444       /* Revision */
.word 0xAF2D9EE6       /* Checksum 1 */
.word 0x7D62A044       /* Checksum 2 */
.word 0x00000000       /* Unknown 1 */
.word 0x00000000       /* Unknown 2 */
.ascii "                    " /* Internal name */
.word 0x00000000       /* Unknown 3 */
.word 0x0000004E       /* Cartridge */
.ascii ""              /* Cartridge ID */
.ascii ""              /* Country code */
.byte 0x00             /* Version */
