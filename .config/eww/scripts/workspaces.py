from os import popen

occupied = []
active = -1

for i in range(0,10):
    stream = popen(f"wmctrl -d | rg \"^{i}\"")
    res = stream.read().strip()
    occupied.append(res != "")
    if '*' in res:
        active = i

workspaces = ""

for i in range(0, 10):
    if not occupied[i]:
        continue

    if active != i:
        workspaces += f"  (button :class \"framed workspace\" :onclick \"wmctrl -s {i}\"  {i+1})\n"
    else:
        workspaces += f"  (button :class \"framed workspace text-red\" :onclick \"wmctrl -s {i}\" {i+1})\n"


res = f"""(box 
    :orientation "h"
    :spacing "3"
    :space-evenly true
{workspaces}
)
"""

print(res)