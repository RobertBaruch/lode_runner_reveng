from absl import app


def main(argv):
    # It's a good thing we have infinite memory
    with open("golden_source.bin", mode="rb") as f:
        golden_source = f.read()
    with open("main.bin", mode="rb") as f:
        target = f.read()

    print(f"Read golden_source.bin, {len(golden_source)} ({len(golden_source):04X}) bytes")
    print(f"Read          main.bin, {len(target)} bytes")

    # The initial loader copies the data to $3F00. Then it moves
    # $3F00-$5EFF to $0000-$1FFF.

    # for i in range(0xC00, 0x1A85):
    #     if (i%16)==0:
    #         print()
    #         print("    HEX     ", end="")
    #     print(f"{golden_source[i]:02X} ", end="")
    # print()

    golden_source_segment1 = golden_source[:0x2000]
    golden_source_segment2 = golden_source[0x2000:]

    print("Comparing segment 1 (0000-1FFF)...")
    for i, b in enumerate(golden_source_segment1):
        if golden_source_segment1[i] != target[i]:
            print(f"Golden source and target differ at location {i:04X}")
            print(f"Golden source: {golden_source_segment1[i]:02X}")
            print(f"       Target: {target[i]:02X}")
            break
    print("Comparing segment 2 (5F00-)...")
    for i, b in enumerate(golden_source_segment2):
        if golden_source_segment2[i] != target[i + 0x5F00]:
            print(f"Golden source and target differ at location {i+0x5F00:04X}")
            print(f"Golden source: {golden_source_segment2[i]:02X}")
            print(f"       Target: {target[i+0x5F00]:02X}")
            break


if __name__ == "__main__":
    app.run(main)
