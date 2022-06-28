from absl import app
import re


def pass1(lines: list[str]) -> dict[int, list[str]]:
    chunks: dict[int, list[str]] = {}
    org: int = -1
    org_re = re.compile("^ +ORG +(\\$?.+) *$")

    chunks[-1] = []
    chunks[0] = []
    for line in lines:
        change_org = org_re.match(line)
        if change_org:
            addr = change_org.group(1)
            if addr[0] == "$":
                org = int(addr[1:], 16)
            else:
                org = int(addr, 10)
            if org not in chunks:
                chunks[org] = []
            continue
        chunks[org].append(line)

    # If there weren't any lines for ORG 0, add a DS 1 so that
    # the ROM output will start at address 0.
    if not len(chunks[0]):
        chunks[0].append("    DS 1")
    return chunks


def main(argv):
    # It's a good thing we have infinite memory
    with open(argv[1]) as f:
        lines = [line.rstrip("\n") for line in f.readlines()]
    chunks = pass1(lines)
    for chunk in sorted(chunks.items()):
        addr = chunk[0]
        lines = chunk[1]
        if addr != -1:
            print(f"    ORG    ${addr:04X}")
        print("\n".join(lines))


if __name__ == "__main__":
    app.run(main)
