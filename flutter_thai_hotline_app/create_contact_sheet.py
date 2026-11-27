from PIL import Image, ImageDraw
from pathlib import Path
import re
import math

root = Path("assets/images")

def natural_key(path):
    return [
        int(part) if part.isdigit() else part.lower()
        for part in re.split(r"(\d+)", str(path))
    ]

files = sorted(root.rglob("*.png"), key=natural_key)

thumb_w, thumb_h = 180, 150
label_h = 32
columns = 5
rows = math.ceil(len(files) / columns)

sheet = Image.new(
    "RGB",
    (columns * thumb_w, rows * (thumb_h + label_h)),
    "#eeeeee"
)

draw = ImageDraw.Draw(sheet)

for index, path in enumerate(files):
    img = Image.open(path).convert("RGBA")
    img.thumbnail((thumb_w - 16, thumb_h - 16))

    x = (index % columns) * thumb_w
    y = (index // columns) * (thumb_h + label_h)

    bg = Image.new("RGBA", (thumb_w, thumb_h), "white")
    bg.alpha_composite(
        img,
        ((thumb_w - img.width) // 2, (thumb_h - img.height) // 2)
    )

    sheet.paste(bg.convert("RGB"), (x, y))
    draw.text(
        (x + 5, y + thumb_h + 5),
        str(path).replace("\\", "/"),
        fill="black"
    )

output = Path("resources_contact_sheet.jpg")
sheet.save(output, quality=95)

print(f"Created: {output.resolve()}")
print(f"Total images: {len(files)}")
