import json
import re

def parse_yaml(filepath):
    with open(filepath, 'r') as f:
        content = f.read()
        
    left_keys = []
    right_keys = []
    
    current_side = None
    
    lines = content.split('\n')
    for line in lines:
        if 'LEFT SIDE' in line:
            current_side = 'left'
            continue
        elif 'RIGHT SIDE' in line:
            current_side = 'right'
            continue
            
        # Parse lines like: - {x: 3.25, y: 4.7, r: 30, rx: 3.25, ry: 4.7}
        match = re.search(r'-\s*\{\s*(.*?)\s*\}', line)
        if match:
            pairs = match.group(1).split(',')
            k = {}
            for pair in pairs:
                name, val = pair.split(':')
                k[name.strip()] = float(val.strip())
                
            # Set default values for rotation properties if not specified
            k['r'] = k.get('r', 0.0)
            k['rx'] = k.get('rx', k['x'])
            k['ry'] = k.get('ry', k['y'])
            
            if current_side == 'left':
                left_keys.append(k)
            elif current_side == 'right':
                right_keys.append(k)
                
    return left_keys, right_keys

def generate_layout():
    # Load coordinates from xxxxx.info.yaml
    left, _ = parse_yaml('xxxxx.info.yaml')
    
    # We enforce perfect mathematical symmetry across the x = 7.5 axis
    x_center = 7.5
    
    # 1. Left side keys extraction (20 keys defined, but only 19 are used in the 38-key layout)
    # - Row 0: Pinky Top, Ring Top, Middle Top, Index Top, Inner Top (5 keys, skipping index 0)
    left_top = left[1:6]
    
    # - Row 1: Outer Pinky Extension (index 0 from top row), Pinky Home, Ring Home, Middle Home, Index Home, Inner Home (6 keys)
    left_home = [left[0]] + left[7:12]
    
    # - Row 2: Pinky Bottom, Ring Bottom, Middle Bottom, Index Bottom, Inner Bottom (5 keys)
    left_bottom = left[12:17]
    
    # - Thumbs: Key 1, Key 2, Key 3 (3 keys)
    left_thumbs = left[17:20]
    
    # 2. Re-mirror left keys to right keys to ensure absolute mathematical symmetry
    # Mirrored top-left corner coordinate is: 2 * x_center - x - key_width (where key_width = 1.0)
    right_top = []
    for k in reversed(left_top):
        right_top.append({
            'x': 2 * x_center - k['x'] - 1.0,
            'y': k['y'],
            'r': -k['r'],
            'rx': 2 * x_center - k['rx'],
            'ry': k['ry']
        })
        
    right_home = []
    for k in reversed(left_home):
        right_home.append({
            'x': 2 * x_center - k['x'] - 1.0,
            'y': k['y'],
            'r': -k['r'],
            'rx': 2 * x_center - k['rx'],
            'ry': k['ry']
        })
        
    right_bottom = []
    for k in reversed(left_bottom):
        right_bottom.append({
            'x': 2 * x_center - k['x'] - 1.0,
            'y': k['y'],
            'r': -k['r'],
            'rx': 2 * x_center - k['rx'],
            'ry': k['ry']
        })
        
    right_thumbs = []
    # Left thumbs are Outer-to-Inner, so mirrored Right thumbs innermost-to-outermost are:
    # Mirrored Key 3 (innermost), Mirrored Key 2 (middle), Mirrored Key 1 (outermost)
    for k in [left_thumbs[2], left_thumbs[1], left_thumbs[0]]:
        right_thumbs.append({
            'x': 2 * x_center - k['x'] - 1.0,
            'y': k['y'],
            'r': -k['r'],
            'rx': 2 * x_center - k['rx'],
            'ry': k['ry']
        })

    # 3. Assemble all 38 keys row-by-row
    all_keys = []
    # Row 0: 10 keys
    all_keys.extend(left_top)
    all_keys.extend(right_top)
    
    # Row 1: 12 keys
    all_keys.extend(left_home)
    all_keys.extend(right_home)
    
    # Row 2: 10 keys
    all_keys.extend(left_bottom)
    all_keys.extend(right_bottom)
    
    # Row 3: 6 keys
    all_keys.extend(left_thumbs)
    all_keys.extend(right_thumbs)
    
    # 4. Normalize coordinates for centering and scaling in keymap-drawer
    xs = [k['x'] for k in all_keys]
    ys = [k['y'] for k in all_keys]
    
    offset_x = 0.5 - min(xs)
    offset_y = 0.5 - min(ys)
    
    formatted_keys = []
    for k in all_keys:
        formatted_keys.append({
            'x': round(k['x'] + offset_x, 3),
            'y': round(k['y'] + offset_y, 3),
            'r': round(k['r'], 1),
            'rx': round(k['rx'] + offset_x, 3),
            'ry': round(k['ry'] + offset_y, 3)
        })
        
    info_json = {
        "keyboard_name": "unsplithk",
        "layouts": {
            "LAYOUT_unsplithk": {
                "layout": formatted_keys
            }
        }
    }
    
    # Write to unsplithk_info.json
    with open('unsplithk_info.json', 'w') as f:
        json.dump(info_json, f, indent=2)
        
    # Open unsplithk.yaml and replace the layout line
    try:
        with open('unsplithk.yaml', 'r') as f:
            content = f.read()
    except FileNotFoundError:
        content = "layout: {zmk_keyboard: unsplithk}\n"
        
    lines = content.split('\n')
    layout_index = -1
    for idx, line in enumerate(lines):
        if line.startswith('layout:'):
            layout_index = idx
            break
            
    layout_str = "layout:\n  qmk_keyboard: unsplithk\n  qmk_layout: LAYOUT_unsplithk"
    
    if layout_index != -1:
        lines[layout_index] = layout_str
        new_content = '\n'.join(lines)
    else:
        new_content = layout_str + "\n" + content
        
    with open('unsplithk.yaml', 'w') as f:
        f.write(new_content)
        
    print("Success! Symmetrical physical layout coordinates with rotation centers successfully generated!")

if __name__ == '__main__':
    generate_layout()
